import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoNotifier extends StateNotifier<VideoPlayerController?> with WidgetsBindingObserver {
  VideoNotifier() : super(null) {
    WidgetsBinding.instance.addObserver(this);
  }

  bool isPlaying = false;
  bool isBuffering = false;
  double bufferProgress = 0.0;

  void loadVideo(String videoUrl) {
    disposeVideo(); // Dispose previous video first

    final newController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    newController.initialize().then((_) {
      state = newController;
      state!.play();
      isPlaying = true;

      // Listen for buffering state
      state!.addListener(() {
        isBuffering = state!.value.isBuffering;

        // Track buffered progress
        final buffered = state!.value.buffered;
        if (buffered.isNotEmpty) {
          bufferProgress = buffered.last.end.inMilliseconds.toDouble() /
              state!.value.duration.inMilliseconds.toDouble();
        }

        // Auto dispose when video ends
        if (state!.value.position >= state!.value.duration) {
          isPlaying = false;
          disposeVideo();
        }
      });
    }).catchError((error) {
      debugPrint("Error initializing video: $error");
    });
  }

  void togglePlayPause() {
    if (state == null) return;
    if (state!.value.isPlaying) {
      state!.pause();
      isPlaying = false;
    } else {
      state!.play();
      isPlaying = true;
    }
  }

  /// **🔹 Fixed Seek Issue**
  void seekTo(Duration position) async {
    if (state == null) return;

    await state!.seekTo(position);
    await Future.delayed(const Duration(milliseconds: 300)); // Give some time to sync
    state!.pause();
    await Future.delayed(const Duration(milliseconds: 300)); // Pause briefly
    state!.play(); // Resume to restore audio
  }

  void disposeVideo() {
    if (state != null) {
      state!.dispose();
      state = null;
      isPlaying = false;
      isBuffering = false;
      bufferProgress = 0.0;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    if (state == null) return;

    if (appState == AppLifecycleState.paused) {
      state!.pause();
    } else if (appState == AppLifecycleState.resumed) {
      state!.play();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    disposeVideo();
    super.dispose();
  }
}

// Riverpod Provider
final videoProvider = StateNotifierProvider<VideoNotifier, VideoPlayerController?>(
  (ref) => VideoNotifier(),
);

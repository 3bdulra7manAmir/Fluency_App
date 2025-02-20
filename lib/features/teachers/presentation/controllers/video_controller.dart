import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoNotifier extends StateNotifier<VideoPlayerController?> with WidgetsBindingObserver {
  VideoNotifier() : super(null)
  {
    WidgetsBinding.instance.addObserver(this);
  }

  void loadVideo(String videoUrl)
  {
    // Dispose previous controller if exists
    if (state != null)
    {
      state!.dispose();
    }

    final newController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    newController.initialize().then((_)
    {
      state = newController; // Set state after initialization
      state!.play();

      // Listen for video completion
      state!.addListener(()
      {
        if (state!.value.position >= state!.value.duration)
        {
          disposeVideo(); // Auto close when video ends
        }
      });

    }).catchError((error)
    {
      print("Error initializing video: $error"); // Debugging
    });
  }

  void togglePlayPause()
  {
    if (state == null) return;
    if (state!.value.isPlaying)
    {
      state!.pause();
    }

    else
    {
      state!.play();
    }
  }

  void disposeVideo()
  {
    if (state != null)
    {
      state!.dispose();
      state = null; // Reset state to trigger UI update
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState)
  {
    if (state == null) return;

    if (appState == AppLifecycleState.paused)
    {
      state!.pause();
    }

    else if (appState == AppLifecycleState.resumed)
    {
      state!.play();
    }
  }

  @override
  void dispose()
  {
    WidgetsBinding.instance.removeObserver(this);
    disposeVideo(); // Ensure proper cleanup
    super.dispose();
  }
}

// Riverpod Provider
final videoProvider = StateNotifierProvider<VideoNotifier, VideoPlayerController?>(
  (ref) => VideoNotifier(),
);

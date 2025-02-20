import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoNotifier extends StateNotifier<VideoPlayerController?> with WidgetsBindingObserver
{
  VideoNotifier() : super(null)
  {
    WidgetsBinding.instance.addObserver(this);
  }

  void loadVideo(String videoUrl)
  {
    if (state != null)
    {
      state!.dispose(); // Dispose previous controller
    }

    final newController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    newController.initialize().then((_)
    {
      state = newController; // Set state after initialization
      state!.play();
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    if (this.state == null) return;

    if (state == AppLifecycleState.paused)
    {
      this.state!.pause();
    }

    else if (state == AppLifecycleState.resumed)
    {
      this.state!.play();
    }
  }

  @override
  void dispose()
  {
    WidgetsBinding.instance.removeObserver(this);
    state?.dispose();
    super.dispose();
  }
}

// Riverpod Provider
final videoProvider = StateNotifierProvider<VideoNotifier, VideoPlayerController?>(
  (ref) => VideoNotifier(),
);

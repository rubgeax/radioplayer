// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({
    Key? key,
    this.width,
    this.height,
    required this.initialUrl,
    required this.sliderActiveColor,
    required this.sliderInactiveColor,
    required this.sliderThumbColor,
    required this.playbackDurationTextColor,
    required this.liveTextColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String initialUrl;
  final Color sliderActiveColor;
  final Color sliderInactiveColor;
  final Color sliderThumbColor;
  final Color playbackDurationTextColor;
  final Color liveTextColor;

  @override
  _RadioPlayerState createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer>
    with TickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  Duration currentPosition = Duration.zero;
  bool isPlaying = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    initRadioPlayer(); // Initializes the player but does not start playback.
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _fadeAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(_animationController);
  }

  Future<void> initRadioPlayer() async {
    audioPlayer = AudioPlayer();

    // Set the initial URL for the audio player.
    await audioPlayer.setUrl(widget.initialUrl);

    // Configure the audio session for background playback.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());

    // Handle audio interruptions and becoming noisy events.
    session.becomingNoisyEventStream.listen((_) => audioPlayer.pause());
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        setState(() => isPlaying = false);
        audioPlayer.pause();
      } else if (!event.begin && isPlaying) {
        audioPlayer.play();
      }
    });

    // Subscribe to the player state stream to handle play/pause state changes.
    audioPlayer.playerStateStream.listen((playerState) {
      final isCurrentlyPlaying = playerState.playing;
      setState(() {
        isPlaying = isCurrentlyPlaying;
      });
    });

    // Subscribe to position updates to move the slider.
    audioPlayer.positionStream.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    // The state will be updated by the listener on the playbackEventStream
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center column content vertically
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center column content horizontally
        children: [
          StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final isCurrentlyPlaying = playerState?.playing ?? false;
              return IconButton(
                iconSize: 48.0, // Increase the icon size if you like
                icon: Icon(isCurrentlyPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _togglePlayPause,
              );
            },
          ),
          StreamBuilder<ProcessingState>(
            stream: audioPlayer.processingStateStream,
            builder: (context, snapshot) {
              final processingState = snapshot.data ?? ProcessingState.idle;
              return Visibility(
                visible: processingState == ProcessingState.buffering,
                child: const Text('Buffering...'),
              );
            },
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: widget.sliderThumbColor,
              activeTrackColor: widget.sliderActiveColor,
              inactiveTrackColor: widget.sliderInactiveColor,
              disabledActiveTrackColor: widget.sliderActiveColor,
              disabledInactiveTrackColor: widget.sliderInactiveColor,
              trackHeight: 3.0,
            ),
            child: Slider(
              value: 1, // Always one, since it's live and at the end
              onChanged: (value) {
                setState(() {}); // Snap back to the end
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: widget.playbackDurationTextColor),
                ),
              ),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
                    'Live',
                    style: TextStyle(color: widget.liveTextColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

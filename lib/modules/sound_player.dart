import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundPlayerScreen extends StatefulWidget {
  final String url;
  final String soundName;
  const SoundPlayerScreen(
      {Key? key, required this.url, required this.soundName})
      : super(key: key);

  @override
  State<SoundPlayerScreen> createState() => _SoundPlayerScreenState();
}

class _SoundPlayerScreenState extends State<SoundPlayerScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    setState(() {
                      seekToSecond(value.toInt());
                      value = value;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(position.toString().split('.').first),
                  Text(duration.toString().split('.').first),
                ],
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      var url = widget.url;

                      await audioPlayer.play(UrlSource(url));
                    }
                  },
                  icon:
                      Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                  iconSize: 50,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.stop();
                  await audioPlayer.release();
                },
                icon: const Icon(Icons.cancel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

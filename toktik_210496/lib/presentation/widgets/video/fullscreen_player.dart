import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_background.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videourl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videourl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videourl)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                // Gradiente
                VideoBackground(stops: const [0.8, 1.0]),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({ required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: titleStyle,
      ),
    );
  }
}
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik_210496/config/helpers/human_formats.dart';
import 'package:toktik_210496/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(valaue: video.likes, iconData: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 20,),

        _CustomIconButton(valaue: video.views, iconData: Icons.remove_red_eye_outlined),

        const SizedBox(height: 20,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(valaue: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int valaue;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.valaue, 
    required this.iconData, 
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
      IconButton(
        onPressed: () {},
        icon: Icon(iconData, color: color, size: 30,)),
      if (valaue > 0)
      Text (HumanFormats.humanReadbleNumber(valaue.toDouble())),
    ]);
  }
}

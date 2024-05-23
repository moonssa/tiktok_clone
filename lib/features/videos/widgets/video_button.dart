import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({super.key, required this.icon, this.text = ""});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (text == "") Gaps.v14,
        FaIcon(
          icon,
          color: Colors.white,
          size: Sizes.size36,
        ),
        Gaps.v5,
        if (text != "")
          Text(text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
      ],
    );
  }
}

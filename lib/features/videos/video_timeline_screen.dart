import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.teal,
  ];
  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(microseconds: 150),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount += 4;
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.teal,
      ]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) => Container(
          color: colors[index],
          alignment: Alignment.center,
          child: Text(
            "Screen $index",
            style: const TextStyle(fontSize: 48),
          )),
    );
  }
}
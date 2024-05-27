import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final int _itemCount = 4;
  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(milliseconds: 300);
  final Curve _curves = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _curves,
    );

    setState(() {});
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _curves,
    // );
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.light,
    // );
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 30,
      edgeOffset: -30,
      color: Theme.of(context).primaryColor,
      strokeWidth: 3,
      child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: _itemCount,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) => VideoPost(
                onVideoFinished: _onVideoFinished,
                index: index,
              )),
    );
  }
}

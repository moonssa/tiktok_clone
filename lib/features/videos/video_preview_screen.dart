import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final XFile video;
  final bool isPicked;

  const VideoPreviewScreen({
    super.key,
    required this.video,
    required this.isPicked,
  });

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerController _videoPlayerController;
  bool _saveVideo = false;

  Future<void> _initVideo() async {
    _videoPlayerController =
        VideoPlayerController.file(File(widget.video.path));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
    setState(
      () {},
    );
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _saveToGallery() async {
    if (_saveVideo) return;

    String filePath = widget.video.path;
    if (!filePath.endsWith('.mp4') && !filePath.endsWith('.mov')) {
      print('Error: The file is not a supported video format.');
      print(filePath);
      return;
    }

    if (!File(filePath).existsSync()) {
      print('Error: The file does not exist.');
      return;
    }

    await GallerySaver.saveVideo(
      widget.video.path,
      albumName: "TikTok Clone",
    );
    _saveVideo = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Preview Video"),
        actions: [
          // if (!widget.isPicked)
          IconButton(
            onPressed: _saveToGallery,
            icon: FaIcon(
              _saveVideo ? FontAwesomeIcons.check : FontAwesomeIcons.download,
            ),
          ),
        ],
      ),
      body: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : null,
    );
  }
}

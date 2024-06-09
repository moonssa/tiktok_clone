import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    with TickerProviderStateMixin {
  bool _hasPermission = false;

  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );

  late final AnimationController _progressAnimationContoller =
      AnimationController(
          vsync: this,
          duration: const Duration(seconds: 10),
          lowerBound: 0.0,
          upperBound: 1.0);

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late CameraController _cameraController;
  late FlashMode _flashMode;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    print(cameras);
    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );
    await _cameraController.initialize();
    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    // await Permission.camera.request();

    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();
    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
    _progressAnimationContoller.addListener(() {
      setState(() {});
    });
    _progressAnimationContoller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  Future<void> _toggleSelfieMode() async {
    print(_isSelfieMode);
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  void _startRecording(TapDownDetails) {
    print("DOWNDOWNDOWN");
    _buttonAnimationController.forward();
    _progressAnimationContoller.forward();
  }

  void _stopRecording() {
    print("UPZUPUPUPU");
    _buttonAnimationController.reverse();
    _progressAnimationContoller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: !_hasPermission || !_cameraController.value.isInitialized
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Initializing...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size20,
                          )),
                      Gaps.v20,
                      CircularProgressIndicator.adaptive(),
                    ],
                  )
                : Stack(alignment: Alignment.center, children: [
                    CameraPreview(_cameraController),
                    Positioned(
                      top: Sizes.size44,
                      right: Sizes.size20,
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: Sizes.size56,
                            color: Colors.white,
                            onPressed: _toggleSelfieMode,
                            icon: const Icon(Icons.cameraswitch),
                          ),
                          IconButton(
                            iconSize: Sizes.size32,
                            color: _flashMode == FlashMode.off
                                ? Colors.amber
                                : Colors.white,
                            onPressed: () => _setFlashMode(FlashMode.off),
                            icon: const Icon(Icons.flash_off_rounded),
                          ),
                          IconButton(
                            iconSize: Sizes.size32,
                            color: _flashMode == FlashMode.always
                                ? Colors.amber
                                : Colors.white,
                            onPressed: () => _setFlashMode(FlashMode.always),
                            icon: const Icon(Icons.flash_on_rounded),
                          ),
                          IconButton(
                            iconSize: Sizes.size32,
                            color: _flashMode == FlashMode.auto
                                ? Colors.amber
                                : Colors.white,
                            onPressed: () => _setFlashMode(FlashMode.auto),
                            icon: const Icon(Icons.flash_auto_rounded),
                          ),
                          IconButton(
                            iconSize: Sizes.size32,
                            color: _flashMode == FlashMode.torch
                                ? Colors.amber
                                : Colors.white,
                            onPressed: () => _setFlashMode(FlashMode.torch),
                            icon: const Icon(Icons.flashlight_on_rounded),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: Sizes.size40,
                      child: GestureDetector(
                        onTapDown: _startRecording,
                        onTapUp: (details) => _stopRecording(),
                        child: ScaleTransition(
                          scale: _buttonAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: Sizes.size80,
                                width: Sizes.size80,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade400,
                                  strokeWidth: Sizes.size6,
                                  value: _progressAnimationContoller.value,
                                ),
                              ),
                              Container(
                                height: Sizes.size60,
                                width: Sizes.size60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])));
  }
}

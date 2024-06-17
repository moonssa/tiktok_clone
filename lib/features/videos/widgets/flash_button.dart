import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({
    super.key,
    required this.currentFlashMode,
    required this.buttonFlashMode,
    required this.setFlashMode,
    required this.buttonIcon,
  });
  final FlashMode currentFlashMode;
  final FlashMode buttonFlashMode;
  final Function(FlashMode) setFlashMode;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: currentFlashMode == buttonFlashMode ? Colors.amber : Colors.white,
      onPressed: () => setFlashMode(buttonFlashMode),
      icon: Icon(
        buttonIcon,
      ),
    );
  }
}

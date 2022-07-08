import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  GradientIcon(
      {required this.size, required this.gradient, required this.imagePath});
  final double size;
  final Gradient gradient;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size,
        height: size,
        child: ImageIcon(
          AssetImage(imagePath),
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

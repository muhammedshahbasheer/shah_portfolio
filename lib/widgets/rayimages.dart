import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RayImage extends StatelessWidget {
  final String imagePath;
  final double baseScale;
  final double rotation;
  final Offset offset;
  final bool active; // 🔥 controlled by parent

  const RayImage({
    super.key,
    required this.imagePath,
    required this.baseScale,
    required this.rotation,
    required this.offset,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: active ? baseScale + 0.25 : baseScale,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.identity()
          ..translate(offset.dx, offset.dy)
          ..rotateZ(rotation),
        decoration: BoxDecoration(
          boxShadow: active
              ? const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
              offset: Offset(0, 18),
            )
          ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            imagePath,
            width: 120,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

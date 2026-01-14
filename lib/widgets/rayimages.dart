import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RayImage extends StatefulWidget {
  final String imagePath;
  final double baseScale;
  final double rotation;
  final Offset offset;

  const RayImage({
    super.key,
    required this.imagePath,
    required this.baseScale,
    required this.rotation,
    required this.offset,
  });

  @override
  State<RayImage> createState() => _RayImageState();
}

class _RayImageState extends State<RayImage> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedScale(
        scale: hover ? widget.baseScale + 0.25 : widget.baseScale,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()
            ..translate(widget.offset.dx, widget.offset.dy)
            ..rotateZ(widget.rotation),
          decoration: BoxDecoration(
            boxShadow: hover
                ? [
              const BoxShadow(
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
              widget.imagePath,
              width: 120,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

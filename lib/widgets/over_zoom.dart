import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final String imagePath;


  const HoverZoomImage({
    super.key,
    required this.imagePath,

  });

  @override
  State<HoverZoomImage> createState() => _HoverZoomImageState();
}

class _HoverZoomImageState extends State<HoverZoomImage> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _hovering ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            boxShadow: _hovering
                ? [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25,
                offset: Offset(0, 15),
              )
            ]
                : [],
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.imagePath,


              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

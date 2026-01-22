import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final String imagePath;
  final String hoverImagePath;
  final double size;

  const HoverZoomImage({
    super.key,
    required this.imagePath,
    required this.hoverImagePath,
    required this.size,
  });

  @override
  State<HoverZoomImage> createState() => _HoverZoomImageState();
}

class _HoverZoomImageState extends State<HoverZoomImage> {
  bool _active = false;

  void _setActive(bool value) {
    setState(() => _active = value);
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 700;

    return GestureDetector(
      onTap: mobile ? () => _setActive(!_active) : null,
      onLongPress: mobile ? () => _setActive(true) : null,
      child: MouseRegion(
        onEnter: mobile ? null : (_) => _setActive(true),
        onExit: mobile ? null : (_) => _setActive(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _active ? 1.12 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: _active
                  ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25,
                  offset: Offset(0, 15),
                ),
              ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                _active ? widget.hoverImagePath : widget.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shah_portfolio/widgets/rayimages.dart';

import 'over_zoom.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final List<String> images;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.images,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// BASE CARD
          _baseCard(),

          /// IMAGE RAY
          if (isHover)
            Positioned(
              top: -150,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // LEFT (smaller)
                    RayImage(
                      imagePath: widget.images[0],
                      baseScale: 0.9,
                      rotation: -0.35,
                      offset: const Offset(-90, 20),
                    ),

                    // CENTER (bigger)
                    RayImage(
                      imagePath: widget.images[1],
                      baseScale: 1.1,
                      rotation: 0,
                      offset: Offset.zero,
                    ),

                    // RIGHT (smaller)
                    RayImage(
                      imagePath: widget.images[2],
                      baseScale: 0.9,
                      rotation: 0.35,
                      offset: const Offset(90, 20),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _baseCard() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 280,
      padding: const EdgeInsets.all(16),
      transform:
      isHover ? (Matrix4.identity()..translate(0, -6)) : Matrix4.identity(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isHover ? Colors.black26 : Colors.black12,
            blurRadius: isHover ? 18 : 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(widget.desc, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

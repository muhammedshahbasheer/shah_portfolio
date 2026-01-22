import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shah_portfolio/widgets/rayimages.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final List<String> images;
  final VoidCallback? ontap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.images,
    this.ontap

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
          _baseCard(),

          /// 🔥 IMAGE RAY (shared hover)

        ],
      ),
    );
  }

  Widget _baseCard() {
    return InkWell(
      onTap: widget.ontap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        height: 140,
        padding: const EdgeInsets.all(16),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
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
        child: Stack(
          children: [
            /// LEFT CONTENT (TEXT)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.desc,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            /// 🔥 RIGHT-SIDE RAY IMAGES (INSIDE CARD)
            if (isHover)
              Positioned(
                right: 12,
                top: 16,
                bottom: 16,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    RayImage(
                      imagePath: widget.images[0],
                      baseScale: 0.75,
                      rotation: -0.25,
                      offset: const Offset(-20, 12),
                      active: isHover,
                    ),
                    RayImage(
                      imagePath: widget.images[1],
                      baseScale: 0.95,
                      rotation: 0,
                      offset: Offset.zero,
                      active: isHover,
                    ),
                    RayImage(
                      imagePath: widget.images[2],
                      baseScale: 0.75,
                      rotation: 0.25,
                      offset: const Offset(-40, 12),
                      active: isHover,
                    ),
                  ],
                ),
              ),

            /// CENTER TEXT BUTTON
            AnimatedOpacity(
              opacity: isHover ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: TextButton(
                  onPressed: widget.ontap,
                  child: const Text(
                    'Show more about project',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

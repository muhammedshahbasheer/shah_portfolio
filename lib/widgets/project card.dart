import 'package:flutter/material.dart';


class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  const ProjectCard({super.key, required this.title, required this.desc});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
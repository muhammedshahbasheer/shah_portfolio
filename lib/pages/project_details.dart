import 'package:flutter/material.dart';

import '../models/project_model.dart';


class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Images
                SizedBox(
                  height: isMobile ? 240 : 380,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: project.images.length,
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 16),
                    itemBuilder: (_, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        project.images[i],
                        fit: BoxFit.cover,
                        width: isMobile ? 300 : 520,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  project.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

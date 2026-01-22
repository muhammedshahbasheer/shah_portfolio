import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  bool uploading = false;

  Future<void> uploadProject() async {
    if (titleCtrl.text.trim().isEmpty ||
        descCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fill all fields')),
      );
      return;
    }

    try {
      setState(() => uploading = true);

      await FirebaseFirestore.instance
          .collection('projects')
          .add({
        'title': titleCtrl.text.trim(),
        'description': descCtrl.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      setState(() => uploading = false);

      titleCtrl.clear();
      descCtrl.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Project added successfully')),
      );
    } catch (e, stack) {
      setState(() => uploading = false);

      debugPrint('Firestore error: $e');
      debugPrintStack(stackTrace: stack);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                labelText: 'Project Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: uploading ? null : uploadProject,
                child: uploading
                    ? const CircularProgressIndicator()
                    : const Text('Add Project'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

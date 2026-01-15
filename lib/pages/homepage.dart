import 'package:flutter/material.dart';
import 'package:shah_portfolio/pages/contact%20page.dart';
import 'package:shah_portfolio/widgets/over_zoom.dart';
import '../widgets/nav_buttons.dart';
import '../widgets/project card.dart';
import '../widgets/section_title.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final galleryKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void downloadResume() {
    final url = 'lib/assets/resume/muhammedshah_resume.pdf';

    html.AnchorElement anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "Muhammedshah_Resume.pdf")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Muhammed Shah',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          NavButton(title: 'Home', ontap: () => scrollTo(homeKey)),
          NavButton(title: 'About', ontap: () => scrollTo(aboutKey)),
          NavButton(title: 'Projects', ontap: () => scrollTo(projectsKey)),
          NavButton(title: 'Gallery', ontap: () => scrollTo(galleryKey)),
          NavButton(title: 'Resume', ontap: downloadResume),

          NavButton(
            title: 'Contact',
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          key: homeKey,
          children: [
            /// HERO SECTION
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  HoverZoomImage(imagePath: "lib/assets/images/shalu.png"),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello, I am',
                        style: TextStyle(color: Colors.white70, fontSize: 22),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Muhammed Shah',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Flutter Developer | Firebase | AI',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50),
                ],
              ),
            ),

            /// ABOUT
            Column(
              key: aboutKey,
              children: [
                const SectionTitle(title: 'About Me'),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'I am a Flutter developer passionate about building mobile and web applications. '
                    'Experienced in Firebase, AI apps, PDF editors and real-time chat systems.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            /// PROJECTS
            Column(
              key: projectsKey,
              children: [
                const SectionTitle(title: 'Projects'),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    ProjectCard(
                      images: [
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                      ],
                      title: 'Wellness App',
                      desc: 'Fitness & diet tracking',
                    ),
                    ProjectCard(
                      images: [
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                      ],
                      title: 'PDF Annotator',
                      desc: 'Draw & save PDFs',
                    ),
                    ProjectCard(
                      images: [
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                        "lib/assets/images/shalu.png",
                      ],
                      title: 'Contractor App',
                      desc: 'Expense & worker management',
                    ),
                  ],
                ),
              ],
            ),

            /// GALLERY
            const SectionTitle(title: 'Gallery'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(6, (index) {
                  return Container(
                    width: width > 800 ? 250 : width / 2 - 32,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/gallery${index + 1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),

            /// FOOTER
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: const Center(
                child: Text(
                  '© 2026 Muhammed Shah | Flutter Developer',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

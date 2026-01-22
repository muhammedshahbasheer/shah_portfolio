import 'package:flutter/material.dart';
import 'package:shah_portfolio/data/project_data.dart';
import 'package:shah_portfolio/firebasedata/datadiing%20screen.dart';
import 'package:shah_portfolio/pages/contact%20page.dart';
import 'package:shah_portfolio/pages/project_details.dart';
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
  late final width = MediaQuery.of(context).size.width;
  late final bool isMobile = width < 500;

  Drawer _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              'Muhammed Shah',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          ListTile(title: const Text('Home'), onTap: () => scrollTo(homeKey)),
          ListTile(title: const Text('About'), onTap: () => scrollTo(aboutKey)),
          ListTile(
            title: const Text('Projects'),
            onTap: () => scrollTo(projectsKey),
          ),
          ListTile(
            title: const Text('Gallery'),
            onTap: () => scrollTo(galleryKey),
          ),
          ListTile(title: const Text('Resume'), onTap: downloadResume),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ContactPage()),
              );
            },
          ),
        ],
      ),
    );
  }

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
    final url = 'assets/resume/muhammed shah.pdf';

    html.AnchorElement anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "Muhammedshah_Resume.pdf")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: isMobile ? _buildMobileDrawer() : null,
      appBar: AppBar(
        leading: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.black,

        actions: isMobile
            ? null
            : [
                NavButton(title: 'Home', ontap: () => scrollTo(homeKey)),
                NavButton(title: 'About', ontap: () => scrollTo(aboutKey)),
                NavButton(
                  title: 'Projects',
                  ontap: () => scrollTo(projectsKey),
                ),
                NavButton(title: 'Gallery', ontap: () => scrollTo(galleryKey)),
                NavButton(title: 'Resume', ontap: downloadResume),
                NavButton(
                  title: 'Contact',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContactPage()),
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
            /// HERO SECTION
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;

                return Container(
                  height: isMobile ? null : 700,
                  width: double.infinity,
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Center(
                    child: isMobile
                        // 📱 MOBILE VIEW → IMAGE TOP, TEXT BELOW
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HoverZoomImage(
                                size: 300,
                                imagePath: "assets/images/profile_shalu.png",
                                hoverImagePath:
                                    "assets/images/hover_profile.png",
                              ),
                              SizedBox(height: 24),
                              Text(
                                'Hello, I am',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Muhammed Shah',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Flutter Developer | Firebase | AI',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        // 🖥️ DESKTOP VIEW → IMAGE + TEXT SIDE BY SIDE
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello, I am',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 22,
                                    ),
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
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset("assets/images/profile_shalu.png"),
                            ],
                          ),
                  ),
                );
              },
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

                const SizedBox(height: 20),

                Column(
                  children: [
                    ProjectCard(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsPage(project: projectsData[0]),
                          ),
                        );
                      },
                      images: [
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                      ],
                      title: 'Wellness App',
                      desc: 'Fitness & diet tracking',
                    ),
                    const SizedBox(height: 20),

                    ProjectCard(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsPage(project: projectsData[0]),
                          ),
                        );
                      },
                      images: [
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                      ],
                      title: 'PDF Annotator',
                      desc: 'Draw & save PDFs',
                    ),
                    const SizedBox(height: 20),

                    ProjectCard(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsPage(project: projectsData[0]),
                          ),
                        );
                      },
                      images: [
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                        "assets/images/shalu.png",
                      ],
                      title: 'Contractor App',
                      desc: 'Expense & worker management',
                    ),
                    const SizedBox(height: 20),

                    ProjectCard(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsPage(project: projectsData[0]),
                          ),
                        );
                      },
                      images: [
                        "assets/images/splash.png",
                        "assets/images/xdf.png",
                        "assets/images/home.png",
                      ],
                      title: 'CLA Survey',
                      desc: 'Survey app front end design during the internship',
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

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {


    Future<void> openWhatsApp() async {
      final phone = '917902723228'; // no +, no spaces
      final message = Uri.encodeComponent('Hi Muhammed Shah, I saw your portfolio!');
      final url = Uri.parse('https://wa.me/$phone?text=$message');

      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not open WhatsApp';
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Let’s connect and build something great 🚀',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              /// CONTACT CARD
              Container(
                width: 420,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    ContactItem(
                      icon: Icons.person,
                      label: 'Name',
                      value: 'MUHAMMED SHAH ',
                    ),
                    Divider(),
                    ContactItem(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'muhammedshahbsheer@gmail.com',
                    ),
                    Divider(),
                    ContactItem(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '+91 7902723228',
                    ),
                    Divider(),
                    ContactItem(
                      icon: Icons.location_on,
                      label: 'Location',
                      value: 'Kerala, India',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),const SizedBox(height: 24),

              InkWell(
                onTap: openWhatsApp,
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.message, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Message me on WhatsApp',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              /// FOOTER
              const Text(
                '© 2026 Muhammedshah Basheer',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Reusable Contact Row
class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

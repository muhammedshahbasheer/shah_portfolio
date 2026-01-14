import 'package:flutter/material.dart';
import 'package:shah_portfolio/pages/homepage.dart';



void main() {
  runApp(const PortfolioApp());
}


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const HomePage(),
    );
  }
}
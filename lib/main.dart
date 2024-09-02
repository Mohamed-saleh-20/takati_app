import 'package:flutter/material.dart';
import 'package:takati_app/feature/home/Home_screen.dart';
import 'package:takati_app/feature/intro/splash_view.dart';
import 'package:takati_app/feature/upload/upload_view.dart';



void main() {
  runApp(const MainApp());
} 

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView() );
    
  }
}

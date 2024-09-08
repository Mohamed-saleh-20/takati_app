import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:takati_app/core/service/local_storage.dart';
import 'package:takati_app/feature/home/Home_screen.dart';
import 'package:takati_app/feature/home/Task_Page.dart';
import 'package:takati_app/feature/intro/splash_view.dart';
import 'package:takati_app/feature/proflie/user_profile.dart';




Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  AppCaching.init();
  runApp(const MainApp());
} 

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfile() );
    
  }
}

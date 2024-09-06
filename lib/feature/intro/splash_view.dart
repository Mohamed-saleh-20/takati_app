import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:takati_app/core/function/navigatore.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/feature/upload/upload_view.dart';



class SplashView extends StatefulWidget {
  const  SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {pushReplacment(context,UploadView());});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //image
           Lottie.asset('assets/logo.json'),
           const Gap(20),
          //text
          Text("Taskati",style: getTitleTextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
          const Gap(20), 
          Text("it's Time to be organized",style:getBodyTextStyle(),),
        
        ],),
      ),
    );
  }
}
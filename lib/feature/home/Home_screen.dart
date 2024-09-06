import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/feature/home/widgets/Home_Header_Widget.dart';
import 'package:takati_app/feature/home/widgets/Today_Widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeHeader(),
              ),
              Gap(30),
             TodayWidget(),Gap(20),
             Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primaryColor,
        selectedTextColor: Colors.white,
        dayTextStyle:TextStyle(fontSize: 16),
        dateTextStyle:TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
        onDateChange: (date) {},
        width: 92,
        height: 120,
        
      ),
    ],
)
              
            
            ],
          ),
        ),
      ),
    );
  }
}

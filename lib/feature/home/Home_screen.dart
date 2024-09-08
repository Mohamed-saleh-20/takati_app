import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/feature/home/widgets/Home_Header_Widget.dart';
import 'package:takati_app/feature/home/widgets/Today_Widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:takati_app/feature/home/widgets/task_item_widget.dart';

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
              TodayWidget(),
              Gap(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primaryColor,
                    selectedTextColor: Colors.white,
                    dayTextStyle: TextStyle(fontSize: 16),
                    dateTextStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    onDateChange: (date) {},
                    width: 92,
                    height: 120,
                  ),
                ],
              ),
              Gap(30),
             Expanded(
      child: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return  Dismissible(
                key:UniqueKey() ,
                background: Container(color: const Color.fromARGB(255, 36, 233, 6), child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [Gap(20),
                    Icon(Icons.check_sharp, color: Colors.white,size: 38,),Gap(10),Text("Done",style: getTitleTextStyle(color: AppColors.whiteColor,fontSize: 24),)
                  ],
                ), ), 
                secondaryBackground: Container(color: Colors.red, child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Delete",style: getTitleTextStyle(color: AppColors.whiteColor,fontSize: 24)),Gap(10),
                    Icon(Icons.delete, color: Colors.white,size: 36,),Gap(10)
                  ],
                ), ),         
                 
              onDismissed: (direction) {
                if(direction== DismissDirection.endToStart){
                    

                }else{}
                ;
              },
              child: TaskItemWidget());
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: 10),
      ),
            )
            ],
          ),
        ),
      ),
    );
  }
}


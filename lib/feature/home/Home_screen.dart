import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/core/widgets/custom_button.dart';

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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,Mohamed",
                          style: getTitleTextStyle(),
                        ),
                        Gap(5),
                        Text(
                          "Have a Nice Day ",
                          style: getBodyTextStyle(),
                        ),
                      ],
                    ),
                    Gap(170),
                    SizedBox(width: 60,height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/user.png'),
                      
                      ),
                    )
                  ],
                ),
              ),
              Gap(30),
              Row(
                children: [
                  Gap(10),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Octobar 30,2023",
                        style: getTitleTextStyle(),
                      ),
                      Gap(
                        10,
                      ),
                      Text(" Today",style: getTitleTextStyle(),)
                    ],
                  ),
                  Gap(110),
                  CustomButton(onPressed: () {}, text: "+ Add Task",width: 120,height: 60,)
                ],
              ),

              ListView.separated(itemBuilder: (Context,index){return Container(color:Color(0xFF4E5AE8),child: Column(children: [Text("OCT",style: getBodyTextStyle(),),Text("30",style: getTitleTextStyle(),),Text("TUE")],));}, separatorBuilder: (context,index){return Gap(10);}, itemCount: 6)
             

            ],
          ),
        ),
      ),
    );
  }
}

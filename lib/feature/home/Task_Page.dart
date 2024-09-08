import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:takati_app/core/function/navigatore.dart';
import 'package:takati_app/core/utils/Custom_text_form_field.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/core/widgets/custom_button.dart';
import 'package:takati_app/feature/home/Home_screen.dart';

class TaskPage extends StatefulWidget {
 const  TaskPage({super.key});
 
  @override
  State<TaskPage> createState() => _nameState();
}

class _nameState extends State<TaskPage> {
  int ColorIndex = 0;
  String? taskdate = DateFormat.yMd().format(DateTime.now());
String? starttime= DateFormat("yy:mm a").format(DateTime.now());
String? endtime= DateFormat("yy:mm a").format(DateTime.now().add(Duration(hours: 2)));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Tasks",
          style: getTitleTextStyle(
              color: AppColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
            onPressed: () {
              pushReplacment(context, HomeScreen());
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: getTitleTextStyle(),
              ),
              Gap(10),
              AppTextFormField.textForm(
                  500, 60, "Enter Title here", BorderRadius.circular(10)),
              Gap(30),
              Text(
                "Note",
                style: getTitleTextStyle(),
              ),
              Gap(10),
              AppTextFormField.textForm(
                  500, 60, "Enter Note here", BorderRadius.circular(10)),
              Gap(30),
              Text(
                "Date",
                style: getTitleTextStyle(),
              ),
              Gap(10),
              SizedBox(
                height: 60,
                width: 500,
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
            
                    showDatePicker(
                      initialDate:DateTime.now() ,
                      context: context, 
                      firstDate:DateTime.now(), 
                      lastDate: DateTime(2040)).then( (value) {
                        if (value !=null){
                        setState(() {
                          taskdate =  DateFormat.yMd().format(value);


                        });
                      }},);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffix: Icon(Icons.calendar_month),
                    hintText: taskdate,
                    hintStyle: getBodyTextStyle(),
                  ),
                ),
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Time",
                          style: getTitleTextStyle(),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 60,
                          width: 500,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {

                               showTimePicker(
                                context: context,initialTime: TimeOfDay.now()
                              ).then((value) {
                                 if (value !=null){
                        setState(() {
                          starttime = value.format(context);


                        });
                      }
                                
                              },
                              );
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffix: Icon(Icons.watch_later_outlined),
                              hintText: starttime,
                              hintStyle: getBodyTextStyle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "End Time",
                          style: getTitleTextStyle(),
                        ),
                        Gap(10),
                        SizedBox(
                          height: 60,
                          width: 500,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              showTimePicker(
                                context: context,initialTime: TimeOfDay.now()
                              ).then((value) {
                                 if (value !=null){
                        setState(() {
                          
                          endtime = value.format(context);

                        });
                      }
                                
                              },
                              );
                            
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffix: Icon(Icons.watch_later_outlined),
                              hintText: endtime,
                              hintStyle: getBodyTextStyle(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colors",
                            style: getTitleTextStyle(fontSize: 20),
                          ),
                          Gap(10),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    ColorIndex=0;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.primaryColor,
                                  child:
                                  ColorIndex==0?
                                   Icon(
                                    Icons.check,
                                    color: Colors.white,
                                
                                  ):null,
                                ),
                              ),
                              Gap(4),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    ColorIndex=1;
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.redColor,
                                    child: 
                                    ColorIndex ==1 ?
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ):null),
                              ),
                              Gap(4),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    ColorIndex=2;
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.orange,
                                    child: 
                                    ColorIndex==2 ?
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ):null
                                    
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    OnPressed: () {},
                    text: "Creat Task",
                    width: 140,
                    height: 60,
                  ),
                  Gap(10)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

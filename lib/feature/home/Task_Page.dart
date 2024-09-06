import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/Custom_text_form_field.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _nameState();
}

class _nameState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
           Text("data",style:  getTitleTextStyle(),),Gap(10)
          ,TextFormField(),Gap(30),
          
          Text("Note",style:  getTitleTextStyle(),),Gap(10),
          TextFormField(),Gap(30),
          
          Text("Date",style:  getTitleTextStyle(),),Gap(10),
          TextFormField(),Gap(30),
          
          
          ],),
        ),
      ),
    );
  }
}
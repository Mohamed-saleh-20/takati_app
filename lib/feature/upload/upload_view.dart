import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/core/widgets/custom_button.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(actions: [TextButton(onPressed: (){}, child: Text("Done",style: getBodyTextStyle(color: Colors.blue)))],),
      
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [CircleAvatar(radius: 100,backgroundImage: AssetImage('assets/user.png'),),Gap(20),
      CustomButton(text: "Upload From Camera", onPressed: () {ImagePicker().pickImage(source: ImageSource.camera) ; },),Gap(20),
      CustomButton(text: "Upload From Galary", onPressed: () {ImagePicker().pickImage(source: ImageSource.gallery) ;  },) ,Gap(30),  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        
        child: Divider(),
      ),Gap(20),
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(  
          
          decoration: InputDecoration(hintText:"Enter Your Name",border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)) ),),
      
      )
      ],)),
  
    );     
  }
}


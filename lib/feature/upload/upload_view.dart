import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takati_app/core/function/navigatore.dart';
import 'package:takati_app/core/service/local_storage.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/core/widgets/custom_button.dart';
import 'package:takati_app/feature/home/Home_screen.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  String? profilepath;
  String name = "";
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (profilepath != null && name.isNotEmpty) { 
                 AppCaching.cacheData("name", name);
                  AppCaching.cacheData("image", profilepath);
                  AppCaching.cacheData("isUpload", true);
                  pushReplacment(context, (AppCaching.getCacheData("isUpload")??false )? HomeScreen():UploadView());
                } else if (profilepath != null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("pleaese Enter Your Name"),
                    backgroundColor: Colors.red,
                  ));
                } else if (profilepath == null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("please upload image and Enter Your Name"),
                    backgroundColor: Colors.red,
                  ));
                } else if (profilepath == null && name.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("pleaese Upload your image"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text("Done", style: getBodyTextStyle(color: Colors.blue)))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 100,
            backgroundImage: (profilepath != null)
                ? FileImage(File(profilepath!))
                : AssetImage('assets/user.png'),
          ),
          Gap(20),
          CustomButton(
            text: "Upload From Camera",
            OnPressed: () {
              print("object");
              PickImage(true);
            },
          ),
          Gap(20),
          CustomButton(
            text: "Upload From Galary",
            OnPressed: () {
              PickImage(false);
            },
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(),
          ),
          Gap(20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ],
      )),
    );
  }

  PickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          profilepath = value.path;
        });
      }
      ;
    });
  }
}

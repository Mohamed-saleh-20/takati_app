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
import 'package:takati_app/feature/home/widgets/Home_Header_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? profilepath;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pushReplacment(context, HomeScreen());
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primaryColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mode_night_outlined,
                size: 28,
              )),
          Gap(10)
        ],
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Stack(children: [
              CircleAvatar(
                maxRadius: 100,
                backgroundImage: (profilepath != null)
                    ? FileImage(File(profilepath!))
                    : AssetImage('assets/user.png'),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(90)),
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: 240,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Gap(50),
                                      CustomButton(
                                        width: 350,
                                        text: "Upload From Camera",
                                        OnPressed: () {
                                          print("object");
                                          PickImage(true);
                                        },
                                      ),
                                      Gap(20),
                                      CustomButton(
                                        width: 350,
                                        text: "Upload From Galary",
                                        OnPressed: () {
                                          PickImage(false);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.camera_enhance_rounded,
                        size: 30,
                        color: AppColors.primaryColor,
                      )),
                ),
              )
            ]),
            Gap(50),
            Divider(
              color: AppColors.primaryColor,
            ),
            Gap(20),
            Row(
              children: [
                Gap(20),
                Expanded(
                    child: Text(
                  AppCaching.getCacheData("name"),
                  style: getTitleTextStyle(
                      color: AppColors.primaryColor, fontSize: 20),
                )),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(40),
                                    Text(
                                      "Change Your Name ",
                                      style: getTitleTextStyle(
                                          fontSize: 20,
                                          color: AppColors.primaryColor),
                                    ),
                                    Gap(20),
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Enter Your Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.primaryColor,
                    )),
                Gap(10),
              ],
            ),
            Spacer(flex: 2,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      OnPressed: () {
                        AppCaching.cacheData("name", name);
                        AppCaching.cacheData("image", profilepath);
                        AppCaching.cacheData("isUpload", true);
                        pushReplacment(context, HomeScreen());
                      },
                      text: "Save Changes"),
                ],
              ),
            ),
            Gap(30),
          ],
        )),
      ),
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
        AppCaching.cacheData("key", value);
      }
      ;
    });
  }
}

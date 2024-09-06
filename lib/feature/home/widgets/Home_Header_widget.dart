
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/service/local_storage.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Gap(0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello , ${AppCaching.getCacheData("name")}",
              style: getTitleTextStyle(color: AppColors.primaryColor),
            ),
            Gap(5),
            Text(
              "Have a Nice Day ",
              style: getBodyTextStyle(),
            ),
          ],
        ),
       Spacer(),
        SizedBox(width: 60,height: 60,
          child: CircleAvatar(
            backgroundImage: (AppCaching.getCacheData("image") != null)
    ? FileImage(File(AppCaching.getCacheData("image")!))
    : AssetImage('assets/user.png'),
          
          ),
        )
      ],
    );
  }
}

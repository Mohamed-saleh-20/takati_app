import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:takati_app/core/utils/font_style.dart';

class AppTextFormField {
  static SizedBox textForm(double width,double height,String hintText ,BorderRadius borderRadius) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: borderRadius),
          hintText: hintText,
          hintStyle: getsmallTextStyle(),
          
        ),
      ),
    );
  }
}

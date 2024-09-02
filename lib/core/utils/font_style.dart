import 'package:flutter/material.dart';
import 'package:takati_app/core/utils/colors.dart';


TextStyle getTitleTextStyle({double? fontSize,Color? color,FontWeight? fontWeight}){
  return TextStyle(
    fontSize: fontSize?? 18,
    color: color ?? Colors.black,
    fontWeight:fontWeight?? FontWeight.w700
  );

}

TextStyle getBodyTextStyle({double? fontSize,Color? color,FontWeight? fontWeight}){
  return TextStyle(
    fontSize: fontSize?? 16,
    color: color ?? AppColors.blackColor,
    fontWeight:fontWeight?? FontWeight.w500
  );

}


TextStyle getsmallTextStyle({double? fontSize,Color? color,FontWeight? fontWeight}){
  return TextStyle(
    fontSize: fontSize?? 14,
    color: color ?? AppColors.grayColor,
    fontWeight:fontWeight?? FontWeight.w400
  );

}
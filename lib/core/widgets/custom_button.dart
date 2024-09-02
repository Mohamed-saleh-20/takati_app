import 'package:flutter/material.dart';
import 'package:takati_app/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     this.width, 
     this.height,
      this.colors,
       required this.onPressed,
        required this.text,
  });
  final double? width;
  final double? height;
  final Color? colors;
  final Function() onPressed;
  final String text;


  @override
  Widget build(BuildContext context) {
    return SizedBox(width:width??220 ,height:height?? 50,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:colors?? AppColors.primaryColor,shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){}, child: Text("+ Add Task",style:TextStyle(color: AppColors.whiteColor),)));
  }
} 
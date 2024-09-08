import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/colors.dart';
import 'package:takati_app/core/utils/font_style.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 110,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter_Task',
                              style: getTitleTextStyle(color: AppColors.whiteColor),
                            ),Gap(5),
                            Row(
                              children: [
                                Icon(Icons.alarm,color: AppColors.whiteColor,),
                                Gap(10),
                                Text('10:00 PM : 12:00 PM',
                                    style: getsmallTextStyle(color: AppColors.whiteColor))
                              ],
                            ),Gap.expand(5),
                              Text(
                              'I will do this task',
                              style: getBodyTextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 0.5,height: 80,color: Colors.white,),Gap(10),
                      RotatedBox(quarterTurns: 3,child: Text("TODO",style: getBodyTextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.w800),)),Gap(4)
                    ],
                  ),
                ),
              );
  }
}


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:takati_app/core/utils/font_style.dart';
import 'package:takati_app/core/widgets/custom_button.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  Gap(10),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Octobar 30,2023",
                        style: getTitleTextStyle(),
                      ),
                      Gap(
                        10,
                      ),
                      Text(" Today",style: getTitleTextStyle(),)
                    ],
                  ),
                  Spacer(),
                  CustomButton(OnPressed: () {}, text: "+ Add Task",width: 140,height: 50,)
                ],
              );

  }
}

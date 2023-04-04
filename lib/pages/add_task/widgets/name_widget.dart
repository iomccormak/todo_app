import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Name',
              style: AppTextStyles.addTaskTextStyle,
            ),
            SizedBox(
              width: 19.w,
            ),
            Container(
              width: 241.w,
              height: 27.h,
              alignment: Alignment.centerLeft,
              child: TextField(
                style: AppTextStyles.pageTextStyle,
                decoration: InputDecoration(
                  hintText: 'Lorem ipsum dolor sit amet',
                  contentPadding: EdgeInsets.only(
                    bottom: 10.h,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}

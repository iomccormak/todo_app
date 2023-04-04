import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_box_decorations.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Time',
              style: AppTextStyles.addTaskTextStyle,
            ),
            SizedBox(
              width: 22.w,
            ),
            GestureDetector(
              child: Container(
                width: 86.w,
                height: 36.w,
                decoration: AppBoxDecorations.greyBoxDecoration,
                alignment: Alignment.center,
                child: Text(
                  time != null
                      ? '${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}'
                      : '',
                  style: AppTextStyles.dateTimeTextStyle,
                ),
              ),
              onTap: () async {
                TimeOfDay? _newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                );
                if (time == null) return;
                setState(() => time = _newTime!);
              },
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

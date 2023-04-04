import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_box_decorations.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Date',
              style: AppTextStyles.addTaskTextStyle,
            ),
            SizedBox(
              width: 24.w,
            ),
            GestureDetector(
              child: Container(
                width: 163.w,
                height: 36.w,
                decoration: AppBoxDecorations.greyBoxDecoration,
                alignment: Alignment.center,
                child: Text(
                  date != null ? DateFormat('dd.MM.yyyy').format(date) : '',
                  style: AppTextStyles.dateTimeTextStyle,
                ),
              ),
              onTap: () async {
                DateTime? _newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2050),
                );
                if (_newDate == null) return;
                setState(() => date = _newDate);
              },
            ),
          ],
        ),
        SizedBox(
          height: 63.h,
        ),
      ],
    );
  }
}

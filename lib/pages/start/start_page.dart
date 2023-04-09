import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/domain/models/sorts.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/common_widgets/buttons/floating_buttons.dart';
import 'package:todo_app/common_widgets/buttons/bottom_bar_buttons.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 27.w,
            top: 126.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 153.w,
                height: 115.h,
                child: Text(
                  'Looks like there is no tasks yet! Go ahead and push a plus button below',
                  style: AppTextStyles.pageTextStyle,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(
            left: 59.04.w,
            bottom: 170.h,
          ),
          child: SvgPicture.asset(AppIcons.arrow),
        ),
        const FloatingButtons(),
        const BottomBarButtons(
          sortType: Sort.descendingSort,
        ),
      ],
    );
  }
}

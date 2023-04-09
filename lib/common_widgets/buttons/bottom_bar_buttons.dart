import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/domain/bloc/tasks_bloc.dart';
import 'package:todo_app/domain/models/sorts.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';

class BottomBarButtons extends StatefulWidget {
  const BottomBarButtons({super.key});

  @override
  State<BottomBarButtons> createState() => _BottomBarButtonsState();
}

class _BottomBarButtonsState extends State<BottomBarButtons> {
  List<bool> _state = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 740.h),
      height: 72.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.lightGrey,
            width: 1.w,
          ),
        ),
        color: AppColors.tabBarBackground,
      ),
      child: Stack(
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                left: 45.w,
                right: 290.w,
                top: 9.h,
              ),
              child: !_state[0]
                  ? SvgPicture.asset(AppIcons.alphabetDescending)
                  : SvgPicture.asset(AppIcons.blueAlphabetDescending),
            ),
            onTap: () {
              setState(() {
                _state = [true, false, false];
              });
              context.read<TasksBloc>().add(
                    const SortByType(
                      sortType: Sort.descendingSort,
                    ),
                  );
            },
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                left: 167.w,
                right: 167.w,
                top: 9.h,
              ),
              child: !_state[1]
                  ? SvgPicture.asset(AppIcons.alphabetAscending)
                  : SvgPicture.asset(AppIcons.blueAlphabetAscending),
            ),
            onTap: () {
              setState(() {
                _state = [false, true, false];
              });
              context.read<TasksBloc>().add(
                    const SortByType(
                      sortType: Sort.ascendingSort,
                    ),
                  );
            },
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                right: 45.w,
                left: 290.w,
                top: 9.h,
              ),
              child: !_state[2]
                  ? SvgPicture.asset(AppIcons.arrowAscending)
                  : SvgPicture.asset(AppIcons.blueArrowAscending),
            ),
            onTap: () {
              setState(() {
                _state = [false, false, true];
              });
              context.read<TasksBloc>().add(
                    const SortByType(
                      sortType: Sort.dateSort,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}

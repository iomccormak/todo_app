import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/domain/bloc/tasks_bloc.dart';
import 'package:todo_app/pages/home/empty_page.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_styles.dart';
import 'package:todo_app/common_widgets/buttons/bottom_bar_buttons.dart';
import 'package:todo_app/common_widgets/buttons/floating_buttons.dart';
import 'package:todo_app/common_widgets/task/task_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 27.w,
              top: 60.h,
            ),
            child: Text(
              'My tasks',
              style: AppTextStyles.titleTextStyle,
            ),
          ),
          SizedBox(height: 41.h),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              if (state is GetTasksState) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 261.w, right: 14.w, top: 74.07.h),
                      child: GestureDetector(
                        child: Text(
                          'Hide completed',
                          style: AppTextStyles.blueTextStyle,
                        ),
                        onTap: () {
                          context.read<TasksBloc>().add(
                                Filter(),
                              );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 110.h,
                        left: 13.w,
                        bottom: 71.h,
                      ),
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          return TaskWidget(task: state.tasks[index]);
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is TasksEmptyState) {
                return const EmptyPage();
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.indigo,
                  ),
                );
              }
            },
          ),
          const FloatingButtons(),
          const BottomBarButtons(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/bloc/tasks_bloc.dart';
import 'package:todo_app/domain/models/task.dart';
import 'package:todo_app/pages/add_task/widgets/app_bar_widget.dart';
import 'package:todo_app/utils/app_box_decorations.dart';
import 'package:todo_app/utils/app_text_styles.dart';
import 'package:uuid/uuid.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController textEditingController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.h),
        child: const AppBarWidget(),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            left: 29.w,
            top: 37.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a task',
                style: AppTextStyles.titleTextStyle,
              ),
              SizedBox(height: 43.h),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Name',
                        style: AppTextStyles.addTaskTextStyle,
                      ),
                      SizedBox(width: 19.w),
                      Container(
                        width: 241.w,
                        height: 30.h,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Task title cannot be empty';
                            } else {
                              return null;
                            }
                          },
                          controller: textEditingController,
                          style: AppTextStyles.pageTextStyle,
                          decoration: InputDecoration(
                            hintText: 'Lorem ipsum dolor sit amet',
                            contentPadding: EdgeInsets.only(bottom: 10.h),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Time',
                        style: AppTextStyles.addTaskTextStyle,
                      ),
                      SizedBox(width: 22.w),
                      GestureDetector(
                        child: Container(
                          width: 86.w,
                          height: 36.w,
                          decoration: AppBoxDecorations.greyBoxDecoration,
                          alignment: Alignment.center,
                          child: Text(
                            '${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')}',
                            style: AppTextStyles.dateTimeTextStyle,
                          ),
                        ),
                        onTap: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );
                          if (newTime == null) return;
                          setState(() => time = newTime);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: AppTextStyles.addTaskTextStyle,
                      ),
                      SizedBox(width: 24.w),
                      GestureDetector(
                        child: Container(
                          width: 163.w,
                          height: 36.w,
                          decoration: AppBoxDecorations.greyBoxDecoration,
                          alignment: Alignment.center,
                          child: Text(
                            DateFormat('dd.MM.yyyy').format(date),
                            style: AppTextStyles.dateTimeTextStyle,
                          ),
                        ),
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2050),
                          );
                          if (newDate == null) return;
                          setState(() => date = newDate);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 63.h),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TasksBloc>().add(
                          AddTask(
                            task: Task(
                              id: const Uuid().v4(),
                              title: textEditingController.text,
                              date: date.copyWith(
                                hour: time.hour,
                                minute: time.minute,
                              ),
                            ),
                          ),
                        );
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 315.w,
                  height: 46.h,
                  decoration: AppBoxDecorations.blackBoxDecoration,
                  alignment: Alignment.center,
                  child: Text(
                    'Done',
                    style: AppTextStyles.buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

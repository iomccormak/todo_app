import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/domain/bloc/tasks_bloc.dart';
import 'package:todo_app/data/repository/repository_drift.dart';
import 'package:todo_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (BuildContext _) => TasksBloc(
        repository: DriftTaskRepository(),
      )..add(GetTasks()),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return DefaultTextHeightBehavior(
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Open Sans",
              ),
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}

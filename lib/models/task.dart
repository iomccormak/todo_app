import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Task {
  final String title;
  final DateTime date;
  final TimeOfDay time;

  Task(String this.title, DateTime this.date, TimeOfDay this.time);
}

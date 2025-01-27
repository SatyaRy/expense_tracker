import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndex extends StateNotifier<int> {
  PageIndex() : super(0);
  void changePage(int index) {
    state = index;
  }
}

final pageIndexProvider = StateNotifierProvider<PageIndex, int>((ref) {
  return PageIndex();
});

class SelectedDate extends StateNotifier<String> {
  SelectedDate() : super("");
  Future datePicker(context) async {
    DateTime? data = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (data != null) {
      state = data.toString().split(" ")[0];
    }
  }
}

final selectedDateProvider = StateNotifierProvider<SelectedDate, String>((ref) {
  return SelectedDate();
});


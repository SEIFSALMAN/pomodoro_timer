import 'package:flutter/material.dart';
import 'package:pomodoro_timer/CacheHelper.dart';

class AppMode extends ChangeNotifier {
  bool? isDarkMode = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDarkMode = fromShared;
      notifyListeners();
    } else {
      isDarkMode = !isDarkMode!;
      CacheHelper.putMode(key: 'isDark', value: isDarkMode!);
      notifyListeners();
    }
  }
}
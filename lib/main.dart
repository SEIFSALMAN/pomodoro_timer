import 'package:flutter/material.dart';
import 'package:pomodoro_timer/CacheHelper.dart';
import 'package:pomodoro_timer/services/app_mode.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_timer/screens/landscape_pomodoro_screen.dart';
import 'package:pomodoro_timer/screens/portarit_pomodoro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var isDark = CacheHelper.getData(key: "isDark");
  print("isDark : $isDark");

  if (isDark == null) {
    isDark = false;
  } else {
    isDark = isDark;
  }
  runApp(MyApp(isDark));
}

class MyApp extends StatefulWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerService>(
          create: (_) => TimerService(),
        ),
        ChangeNotifierProvider<AppMode>(
          create: (_) => AppMode()..changeAppMode(fromShared: widget.isDark),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return PomodoroTimerScreen();
            } else {
              return TomatoTrekScreen();
            }
          },
        ),
      ),
    );
  }
}

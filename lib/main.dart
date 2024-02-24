import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_timer/screens/landscape_pomodoro_screen.dart';
import 'package:pomodoro_timer/screens/portarit_pomodoro_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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

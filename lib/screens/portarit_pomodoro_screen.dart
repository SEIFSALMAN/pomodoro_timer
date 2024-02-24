import 'package:flutter/material.dart';
import 'package:pomodoro_timer/components/navigator.dart';
import 'package:pomodoro_timer/components/progress_widget.dart';
import 'package:pomodoro_timer/components/timecontroller.dart';
import 'package:pomodoro_timer/components/timeoptions.dart';
import 'package:pomodoro_timer/components/timercard.dart';
import 'package:pomodoro_timer/screens/settings_screen.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:pomodoro_timer/styles/utils.dart';
import 'package:provider/provider.dart';

class PomodoroTimerScreen extends StatelessWidget {
  const PomodoroTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderScreenColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderScreenColor(provider.currentState),
        title: Text(
          "TOMATOTREK",
          style: textStyle(23, Colors.white, FontWeight.w700),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 25,),
              TimerCard(),
              SizedBox(height: 40,),
              TimeOptions(),
              SizedBox(height: 50,),
              TimeController(),
              SizedBox(height: 50,),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

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

class TomatoTrekScreen extends StatelessWidget {
  const TomatoTrekScreen({super.key});

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
        actions: [
          IconButton(
              onPressed: () {
                AppNavigator.customNavigator(
                    context: context,
                    screen: const SettingsScreen(),
                    finish: false);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: Row(
                    children: [
                      Text(
                        provider.currentState,
                        style: textStyle(35, Colors.white, FontWeight.w700),
                      ),
                      Spacer(),
                      LandscapeProgressIndicator()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LandscapeTimerCard(),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10),
                      child: LandscapeTimeController(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TimeOptions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

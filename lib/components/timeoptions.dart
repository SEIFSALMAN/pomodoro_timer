// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:pomodoro_timer/styles/utils.dart';
import 'package:provider/provider.dart';
class TimeOptions extends StatelessWidget {


  List selectableTimes = [
    "300",
    "600",
    "900",
    "1200",
    "1500",
    "1800",
    "2100",
    "2400",
    "2700",
    "3000",
    "3300",
    "3600",
  ];

  TimeOptions({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 95),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            radius: 1,
            onTap: ()=> provider.selectTime(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime
                  ?
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              )
              :
              BoxDecoration(
                border: Border.all(width: 3, color: Colors.white30),
                borderRadius: BorderRadius.circular(5),
              )
              ,
              child: Center(
                  child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: textStyle(25,int.parse(time) == provider.selectedTime ? renderTextColor(provider.currentState) : Colors.white, FontWeight.w700),
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LandscapeTimeOptions extends StatelessWidget {


  List selectableTimes = [
    "300",
    "600",
    "900",
    "1200",
    "1500",
    "1800",
    "2100",
    "2400",
    "2700",
    "3000",
    "3300",
    "3600",
  ];

  LandscapeTimeOptions({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 95),
      scrollDirection: Axis.vertical,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            radius: 1,
            onTap: ()=> provider.selectTime(double.parse(time)),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime
                  ?
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              )
              :
              BoxDecoration(
                border: Border.all(width: 3, color: Colors.white30),
                borderRadius: BorderRadius.circular(5),
              )
              ,
              child: Center(
                  child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: textStyle(25,int.parse(time) == provider.selectedTime ? renderTextColor(provider.currentState) : Colors.white, FontWeight.w700),
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}

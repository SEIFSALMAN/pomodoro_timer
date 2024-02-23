import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:pomodoro_timer/styles/utils.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${provider.rounds}/${provider.totalRounds}",style: textStyle(30,Colors.grey[100],FontWeight.bold),),
            Text("${provider.goals}/${provider.totalGoals}",style: textStyle(30,Colors.grey[100],FontWeight.bold),)
          ],
        ),
        SizedBox(width: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ROUND",style: textStyle(25,Colors.white,FontWeight.bold),),
            Text("GOAL",style: textStyle(25,Colors.white,FontWeight.bold),)
          ],
        ),
      ],
    );
  }
}


class LandscapeProgressIndicator extends StatelessWidget {
  const LandscapeProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          children: [
            Text("${provider.rounds}/${provider.totalRounds}",style: textStyle(30,Colors.grey[100],FontWeight.bold),),
            SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
            Text("${provider.goals}/${provider.totalGoals}",style: textStyle(30,Colors.grey[100],FontWeight.bold),)
          ],
        ),
        SizedBox(width: 10,),
        Row(
          children: [
            Text("ROUND",style: textStyle(25,Colors.white,FontWeight.bold),),
            SizedBox(width: MediaQuery.of(context).size.width * 0.058,),
            Text("GOAL",style: textStyle(25,Colors.white,FontWeight.bold),)
          ],
        ),
      ],
    );
  }
}

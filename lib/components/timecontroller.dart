import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/timerservice.dart';
import 'package:provider/provider.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              provider.resetTimer();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 35,
            )),
        SizedBox(width: 10,),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
          child: Center(
              child: IconButton(
            onPressed: () {
              provider.timerPlaying
                  ? Provider.of<TimerService>(context, listen: false).pauseTimer()
                  : Provider.of<TimerService>(context, listen: false).startTimer();
            },
            icon: provider.timerPlaying
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow_sharp),
            color: Colors.white,
            iconSize: 65,
          )),
        ),
        SizedBox(width: 10,),
        IconButton(
            onPressed: () {
              provider.skipRound();
            },
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 35,
            ))
      ],
    );
  }
}


class LandscapeTimeController extends StatefulWidget {
  const LandscapeTimeController({super.key});

  @override
  State<LandscapeTimeController> createState() => _LandscapeTimeControllerState();
}

class _LandscapeTimeControllerState extends State<LandscapeTimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              provider.resetTimer();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 35,
            )),
        SizedBox(width: 15,),
        Container(
          height: MediaQuery.of(context).size.height*0.29,
          width: MediaQuery.of(context).size.width * 0.09,
          decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
          child: Center(
              child: IconButton(
                onPressed: () {
                  provider.timerPlaying
                      ? Provider.of<TimerService>(context, listen: false).pauseTimer()
                      : Provider.of<TimerService>(context, listen: false).startTimer();
                },
                icon: provider.timerPlaying
                    ? Icon(Icons.pause)
                    : Icon(Icons.play_arrow_sharp),
                color: Colors.white,
                iconSize: 50,
              )),
        ),
        SizedBox(width: 15,),
        IconButton(
            onPressed: () {
              provider.skipRound();
            },
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 35,
            ))
      ],
    );
  }

}


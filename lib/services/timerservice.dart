import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerService extends ChangeNotifier {
  final clockAudioPlayer = AssetsAudioPlayer();

  Timer? timer;
  double currentDuration = 1200;
  double selectedTime = 1200;
  double breakDuration = 300;
  double longBreakDuration = 900;
  bool timerPlaying = false;
  int rounds = 0;
  int totalRounds = 4;
  int goals = 0;
  int totalGoals = 12;
  String currentState = "FOCUS";

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void resetTimer() {
    clockAudioPlayer.pause();
    timer!.cancel();
    currentState = "FOCUS";
    currentDuration = selectedTime = 600;
    rounds = goals = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void pauseTimer() {
    clockAudioPlayer.pause();
    timer!.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void startTimer() {
    clockAudioPlayer.open(Audio('assets/clockTrim.mp3'),
        autoStart: false,
        loopMode: LoopMode.playlist,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        volume: 0.4);

    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        clockAudioPlayer.pause();
        handleNextRound();
      } else {
        clockAudioPlayer.play();
        HapticFeedback.mediumImpact();
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = breakDuration;
      selectedTime = breakDuration;
      rounds++;
      goals++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 900;
      selectedTime = 900;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = longBreakDuration;
      selectedTime = longBreakDuration;
      rounds++;
      goals++;
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 900;
      selectedTime = 900;
      rounds = 0;
    }
  }

  void skipRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = breakDuration;
      selectedTime = breakDuration;
      rounds++;
      goals++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = longBreakDuration;
      selectedTime = longBreakDuration;
      rounds++;
      goals++;
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
  }
}

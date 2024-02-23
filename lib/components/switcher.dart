import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/app_mode.dart';
import 'package:provider/provider.dart';


class DarkLightSwitcher extends StatefulWidget {


  @override
  State<DarkLightSwitcher> createState() => _DarkLightSwitcherState();
}

class _DarkLightSwitcherState extends State<DarkLightSwitcher> {

  @override
  Widget build(BuildContext context) {
    bool light = Provider.of<AppMode>(context).isDarkMode!;
    return Switch(
      // This bool value toggles the switch.
      activeTrackColor: Colors.black26,
      inactiveTrackColor: Colors.white,
      activeColor: Colors.black,
      thumbColor: MaterialStateProperty.all(Colors.transparent),
      activeThumbImage: const AssetImage('assets/night-mode.png'),
      trackOutlineColor: MaterialStateProperty.all(Colors.grey),
      inactiveThumbImage: const AssetImage('assets/day_mode.png'),
      value: light,
      onChanged: (bool value) {
        setState(() {
          Provider.of<AppMode>(context).changeAppMode();
          light = value;
        });
      },
    );
  }
}

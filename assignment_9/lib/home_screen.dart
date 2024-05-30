import 'dart:async';

import 'package:assignment_9/widgets/play_reset_button.dart';
import 'package:assignment_9/widgets/time_card.dart';
import 'package:assignment_9/widgets/time_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTime = 900;
  int _pomodoroTime = 900;
  int _round = 0;
  int _goal = 0;
  bool _isRunning = false;
  bool _isResting = false;

  final int _restTime = 10;

  late Timer _timer;

  void _onTimeTap(int value) {
    if (_isRunning) return;

    setState(() {
      _selectedTime = value * 60;
      _pomodoroTime = value * 60;
    });

    _formatingMin(_pomodoroTime);
    _formatingSec(_pomodoroTime);
  }

  String _formatingMin(int time) {
    var duration = Duration(seconds: time);
    return duration.toString().split(".").first.substring(2, 4);
  }

  String _formatingSec(int time) {
    var duration = Duration(seconds: time);
    return duration.toString().split(".").first.substring(5, 7);
  }

  void _onTickTack(Timer timer) {
    setState(() {
      if (_pomodoroTime == 0 && !_isResting) {
        _round += 1;
        _isResting = true;
        _pomodoroTime = _restTime;
        _timer.cancel();
        _onStartPressed();
      } else if (_pomodoroTime == 0 && _isResting) {
        _pomodoroTime = _selectedTime;
        _isResting = false;
        _timer.cancel();
        _onStartPressed();
      }

      if (_round == 4 && !_isResting) {
        _goal += 1;
        _round = 0;
      } else {
        _pomodoroTime -= 1;
      }
    });
  }

  void _onResetPressed() {
    setState(() {
      _timer.cancel();
      _pomodoroTime = _selectedTime;
      _isRunning = false;
    });
  }

  void _onStartPressed() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onTickTack,
    );

    setState(() {
      _isRunning = true;
    });
  }

  void _onStopPressed() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 0), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POMOTIMER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    TimeCard(
                      min: _formatingMin(_pomodoroTime),
                      sec: _formatingSec(_pomodoroTime),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: TimeList(
                  onTimeTap: _onTimeTap,
                  selectedTime: _selectedTime,
                ),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: PlayResetButtons(
                          isRunning: _isRunning,
                          onStartPressed: _onStartPressed,
                          onStopPressed: _onStopPressed,
                          onResetPressed: _onResetPressed,
                          pomodoroTime: _pomodoroTime,
                          selectedTime: _selectedTime,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "$_round/4",
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "ROUND",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "$_goal/12",
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "GOAL",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

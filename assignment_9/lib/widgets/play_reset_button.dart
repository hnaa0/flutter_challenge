import 'package:flutter/material.dart';

class PlayResetButtons extends StatelessWidget {
  final bool isRunning;
  final Function onStopPressed;
  final Function onStartPressed;
  final Function onResetPressed;
  final int selectedTime;
  final int pomodoroTime;

  const PlayResetButtons({
    super.key,
    required this.isRunning,
    required this.onStopPressed,
    required this.onStartPressed,
    required this.selectedTime,
    required this.pomodoroTime,
    required this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => isRunning ? onStopPressed() : onStartPressed(),
          icon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(isRunning ? Icons.pause : Icons.play_arrow_rounded),
          ),
          iconSize: 52,
        ),
        const SizedBox(
          height: 10,
        ),
        selectedTime != pomodoroTime
            ? IconButton(
                onPressed: () => onResetPressed(),
                icon: const Icon(Icons.refresh),
              )
            : Container(),
      ],
    );
  }
}

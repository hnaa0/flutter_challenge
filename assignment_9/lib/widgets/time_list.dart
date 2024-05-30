import 'package:flutter/material.dart';

class TimeList extends StatelessWidget {
  final Function onTimeTap;
  final int selectedTime;

  TimeList({
    super.key,
    required this.onTimeTap,
    required this.selectedTime,
  });

  final List<int> times = [1, 5, 10, 15, 20, 25, 30, 35, 40];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            tileMode: TileMode.mirror,
            stops: const [0, 0.05, 0.95, 1],
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
              Colors.white.withOpacity(0),
              Colors.white,
            ],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: times.map((time) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: TextButton(
                    onPressed: () => onTimeTap(time),
                    style: TextButton.styleFrom(
                      backgroundColor: selectedTime == time * 60
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                    child: Text(
                      "$time",
                      style: TextStyle(
                          fontSize: 24,
                          color:
                              selectedTime == time * 60 ? Colors.white : null),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final CurvedAnimation _curved = CurvedAnimation(
    parent: _animationController,
    curve: Curves.bounceOut,
  );

  final int _settingTime = 10;
  late int _runningTime = _settingTime;
  bool _isRunning = false;
  bool _isCompleted = false;

  Timer? _timer;

  late Animation<double> _progress = Tween(
    begin: 0.001,
    end: 0.001,
  ).animate(_curved);

  void _animateValue() {
    setState(() {
      _progress = Tween(
        begin: _progress.value,
        end: max(0.001, (_settingTime - _runningTime) / _settingTime),
      ).animate(_curved);
    });
    _animationController.reset();
    _animationController.forward();
  }

  void _onTikTak(Timer timer) {
    _runningTime -= 1;
    _animateValue();

    if (_runningTime == 0) {
      _complete();
      // _reset();
    }
  }

  void _play() {
    setState(() {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        _onTikTak,
      );

      _isRunning = true;
    });
  }

  void _pause() {
    setState(() {
      _timer?.cancel();

      _isRunning = false;
    });
  }

  void _reset() {
    setState(() {
      _isCompleted = false;
      _timer?.cancel();

      _runningTime = _settingTime;
      _isRunning = false;

      _progress = Tween(
        begin: 0.001,
        end: 0.001,
      ).animate(_curved);

      _animationController.reset();
    });
  }

  void _stop() {
    setState(() {
      _isCompleted = false;
      _timer?.cancel();

      _runningTime = _settingTime;
      _isRunning = false;

      _progress = Tween(
        begin: 0.001,
        end: 0.001,
      ).animate(_curved);

      _animationController.reset();
    });
  }

  void _complete() {
    setState(() {
      _isCompleted = true;
      _progress = Tween(
        begin: 1.0,
        end: 1.0,
      ).animate(_curved);
    });

    Timer(const Duration(milliseconds: 1500), _reset);
  }

  String _formatingTime(int time) {
    var duration = Duration(seconds: time);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomodoro"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: TimePainter(progress: _progress.value),
                        size: Size(
                          MediaQuery.of(context).size.width * 0.7,
                          MediaQuery.of(context).size.width * 0.7,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    child: AnimatedScale(
                      scale: _isCompleted ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          _isCompleted ? "00:00" : _formatingTime(_runningTime),
                          style: const TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _reset,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.restart_alt_rounded,
                        size: 24,
                        color: Color(0xFFA0A0A0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: _isRunning ? _pause : _play,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xffC7B8EA),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isRunning ? Icons.pause : Icons.play_arrow_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: _stop,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.stop,
                        size: 24,
                        color: Color(0xFFA0A0A0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimePainter extends CustomPainter {
  final double progress;

  TimePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = (size.width / 2 * 0.9);

    final circlePaint = Paint()
      ..color = const Color(0xFFEBEBEB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    canvas.drawCircle(
      center,
      radius,
      circlePaint,
    );

    final timeArcRect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final timeArcPaint = Paint()
      ..color = const Color(0xffC7B8EA)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20;

    canvas.drawArc(
      timeArcRect,
      -0.5 * pi,
      progress * 2 * pi,
      false,
      timeArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant TimePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

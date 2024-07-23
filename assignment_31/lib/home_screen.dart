import 'dart:math';

import 'package:assignment_31/quiz.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _position = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
    lowerBound: (size.width + 100) * -1,
    upperBound: size.width + 100,
    value: 0.0,
  );

  late final AnimationController _progress = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
    value: 1 / quiz.length,
  );

  bool _isFront = true;
  bool _isFlipping = false;
  int _idx = 0;

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scale = Tween(
    begin: 0.9,
    end: 1,
  );

  late final Tween<double> _opacity = Tween(
    begin: 0,
    end: 1,
  );

  void _swipeComplete() {
    final nextIdx = (_idx + 1) % quiz.length;

    _progress
        .animateTo((_idx == quiz.length ? 1 : _idx + 1) / quiz.length,
            curve: Curves.easeInOut)
        .then((value) {
      setState(() {
        _idx = nextIdx;
        _isFront = true;
      });

      _position.value = 0;
    });
  }

  void _onFlipTap() {
    setState(() {
      _isFront = !_isFront;
      _isFlipping = !_isFlipping;
    });
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _position.value += details.delta.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final bound = size.width - 200;
    final dropZone = size.width + 100;

    if (_position.value.abs() >= bound) {
      final factor = _position.value.isNegative ? -1 : 1;

      _position
          .animateTo(
        dropZone * factor,
        curve: Curves.easeOut,
      )
          .whenComplete(() {
        _swipeComplete();
      });
    } else {
      _position.animateTo(
        0,
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _position.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _position,
        builder: (context, child) {
          final angle = _rotation
              .transform((_position.value + size.width / 2) / size.width);
          final scale = _scale.transform(_position.value.abs() / size.width);
          final opaticy =
              _opacity.transform(_position.value.abs() * 3 / size.width);
          final bgColor = _position.value < 0
              ? ColorTween(
                  begin: Colors.blue.shade100,
                  end: Colors.red.shade200,
                ).transform(_position.value.abs() / size.width)
              : ColorTween(
                  begin: Colors.blue.shade100,
                  end: Colors.green.shade200,
                ).transform(_position.value.abs() / size.width);

          return Container(
            color: bgColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 120,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _position.value != 0 ? min(opaticy, 1.0) : 0,
                    child: Text(
                      _position.value == 0
                          ? " "
                          : _position.value > 0
                              ? "Got it!🥳"
                              : "Hmm🤔",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: 1,
                    child: Transform.scale(
                      scale: min(scale, 1.0),
                      child: Card(
                        index: _idx == quiz.length - 1 ? 1 : _idx + 1,
                        isFront: true,
                        isFlipping: _isFlipping,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: GestureDetector(
                    onTap: _onFlipTap,
                    onHorizontalDragUpdate: _onHorizontalDragUpdate,
                    onHorizontalDragEnd: _onHorizontalDragEnd,
                    child: Transform.translate(
                      offset: Offset(_position.value, 0),
                      child: Transform.rotate(
                        angle: angle * pi / 180,
                        child: AnimatedContainer(
                          onEnd: () {
                            setState(() {
                              _isFlipping = false;
                            });
                          },
                          transformAlignment: Alignment.center,
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(_isFront ? 0 : pi),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(_isFront ? 0 : pi),
                            child: Card(
                              isFront: _isFront,
                              isFlipping: _isFlipping,
                              index: _idx,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: AnimatedBuilder(
                    animation: _progress,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(size.width - 100, 10),
                        painter: ProgressBarPainter(
                          progressValue: _progress.value,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.isFront,
    required this.isFlipping,
    required this.index,
  });

  final bool isFront;
  final bool isFlipping;
  final int index;

  @override
  Widget build(BuildContext context) {
    late final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: size.width * 0.7,
      height: size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: Colors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            color: Colors.blue.shade200,
            width: 3,
          ),
        ),
        child: AnimatedOpacity(
          duration: const Duration(
            milliseconds: 600,
          ),
          opacity: isFlipping ? 0 : 1,
          child: Text(
            textAlign: TextAlign.center,
            isFlipping
                ? ""
                : isFront
                    ? quiz[index].question
                    : quiz[index].answer,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: isFront ? Colors.black : Colors.indigo.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final double progressValue;

  ProgressBarPainter({
    required this.progressValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //total
    final total = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final totalRRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(16),
    );

    canvas.drawRRect(totalRRect, total);

    //progress
    final progress = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final progressRRect = RRect.fromLTRBR(
      0,
      0,
      progressValue * size.width,
      size.height,
      const Radius.circular(16),
    );

    canvas.drawRRect(progressRRect, progress);
  }

  @override
  bool shouldRepaint(covariant ProgressBarPainter oldDelegate) {
    return oldDelegate.progressValue != progressValue;
  }
}

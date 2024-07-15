import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool _isCircle = false;
  double _beginValue = 0;
  double _endValue = 1.0;

  @override
  void initState() {
    super.initState();
  }

  void _animations() {
    setState(() {
      double temp = _beginValue;
      _beginValue = _endValue;
      _endValue = temp;

      _isCircle = !_isCircle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isCircle ? Colors.white : Colors.black,
      appBar: AppBar(
        title: const Text(
          "Assginment 28",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(
            begin: _beginValue,
            end: _endValue,
          ),
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOut,
          onEnd: _animations,
          builder: (context, value, child) {
            final leftPosition =
                value * (MediaQuery.of(context).size.width * 0.6 - 10);

            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    shape: _isCircle ? BoxShape.circle : BoxShape.rectangle,
                  ),
                ),
                Positioned(
                  left: leftPosition,
                  child: Container(
                    width: 10,
                    height: MediaQuery.of(context).size.width * 0.6,
                    color: _isCircle ? Colors.black : Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

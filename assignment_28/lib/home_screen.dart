import 'package:assignment_28/implicit_animations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImplicitAnimations(),
                    ),
                  );
                },
                child: const Text(
                  "Assignment 28 | Implicit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

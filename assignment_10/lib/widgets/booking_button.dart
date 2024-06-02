import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: FilledButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog.adaptive(
                content: const Text("Booking completed🎉"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("check"),
                  ),
                ],
              );
            },
          );
        },
        child: const Text(
          "BOOKING",
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

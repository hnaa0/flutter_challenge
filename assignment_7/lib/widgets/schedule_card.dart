import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final List<String> attend;
  final Color bgColor;
  final String title;
  final DateTime startTime;
  final DateTime endTime;

  const ScheduleCard({
    super.key,
    required this.attend,
    required this.bgColor,
    required this.title,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final visiblePerson = attend.getRange(0, 3).toList();
    final extraPerson = attend.length - visiblePerson.length;

    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  "${startTime.hour}".padLeft(2, "0"),
                  style: const TextStyle(
                    fontSize: 24,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "${startTime.minute}".padLeft(2, "0"),
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1,
                    letterSpacing: -0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 2,
                  ),
                  child: Container(
                    height: 28,
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "${endTime.hour}".padLeft(2, "0"),
                  style: const TextStyle(
                    fontSize: 24,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "${endTime.minute}".padLeft(2, "0"),
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 48,
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      for (var person in visiblePerson)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            person.toUpperCase(),
                            style: TextStyle(
                              color: person == "me"
                                  ? Colors.black
                                  : Colors.grey.shade600,
                              fontWeight: person == "me"
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      Text(
                        extraPerson > 0 ? "+ $extraPerson" : "",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

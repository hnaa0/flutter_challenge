import 'package:assignment_7/widgets/schedule_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 70,
        title: const CircleAvatar(
          radius: 30,
          foregroundImage: NetworkImage(
            "https://images.pexels.com/photos/3560044/pexels-photo-3560044.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
          child: Text("profile"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 32,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 28,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Row(
                children: [
                  Text(
                    "MONDAY 16",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF22668D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              scrollDirection: Axis.horizontal,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.grey.shade800,
                ),
                child: Row(
                  children: [
                    const Text(
                      "TODAY",
                      style: TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Text("17"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("18"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("19"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("20"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("21"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("22"),
                    const SizedBox(
                      width: 14,
                    ),
                    const Text("23"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 40),
                  child: Column(
                    children: [
                      ScheduleCard(
                        startTime: DateTime(2024, 9, 16, 11, 30),
                        endTime: DateTime(2024, 9, 16, 12, 30),
                        title: "design meeting",
                        bgColor: const Color(0xFF68D2E8),
                        attend: const [
                          "blue",
                          "theo",
                          "nana",
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ScheduleCard(
                        startTime: DateTime(2024, 9, 16, 12, 35),
                        endTime: DateTime(2024, 9, 16, 14, 10),
                        title: "daily project",
                        bgColor: const Color(0xFFFEEFAD),
                        attend: const [
                          "me",
                          "gnar",
                          "karen",
                          "nana",
                          "blue",
                          "david",
                          "maria",
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ScheduleCard(
                        startTime: DateTime(2024, 9, 16, 15, 00),
                        endTime: DateTime(2024, 9, 16, 16, 30),
                        title: "weekly planning",
                        bgColor: const Color(0xFFFDDE55),
                        attend: const [
                          "den",
                          "nana",
                          "mark",
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

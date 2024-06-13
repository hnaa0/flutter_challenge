import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<Map<String, String>> reports = [
  {
    "title": "Why are you reporting this thread?",
    "subTitle":
        "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
  },
  {
    "title": "I just don't like it",
    "subTitle": "",
  },
  {
    "title": "It's unlawful content under NetzDG",
    "subTitle": "",
  },
  {
    "title": "It's spam",
    "subTitle": "",
  },
  {
    "title": "Hate speech or symbols",
    "subTitle": "",
  },
  {
    "title": "Nudity or sexual activity",
    "subTitle": "",
  },
  {
    "title": "Violence or dangerous organizations",
    "subTitle": "",
  },
  {
    "title": "Sale of illegal or regulated goods",
    "subTitle": "",
  },
  {
    "title": "Bullying or harassment",
    "subTitle": "",
  },
];

class EllipsisBottomSheetReport extends StatelessWidget {
  const EllipsisBottomSheetReport({
    super.key,
    required this.onBackTap,
  });

  final Function onBackTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.size20,
          ),
        ),
        centerTitle: true,
        leading: Container(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onBackTap(),
            child: const Padding(
              padding: EdgeInsets.all(
                Sizes.size10,
              ),
              child: FaIcon(
                FontAwesomeIcons.angleLeft,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
        toolbarHeight: Sizes.size40,
      ),
      body: ListView.separated(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                bottom: reports[index]["subTitle"] != "" ? Sizes.size4 : 0,
              ),
              child: Text(
                reports[index]["title"]!,
                style: reports[index]["subTitle"] != ""
                    ? const TextStyle(
                        fontWeight: FontWeight.w700,
                      )
                    : null,
              ),
            ),
            subtitle: reports[index]["subTitle"] != ""
                ? const Text(
                    "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.darkGray,
                      ),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.zero,
            trailing: index == 0
                ? null
                : const FaIcon(
                    FontAwesomeIcons.angleRight,
                    size: Sizes.size18,
                    color: Color(
                      ThemeColors.lightGray,
                    ),
                  ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: Sizes.size1,
          color: Color(
            ThemeColors.extraLightGray,
          ),
        ),
      ),
    );
  }
}

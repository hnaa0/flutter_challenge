import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum LeadingType {
  cancel,
  back,
  none,
}

extension LeadingTypeExtenstion on LeadingType {
  Widget intoWidget(
    BuildContext context,
  ) {
    switch (this) {
      case LeadingType.back:
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: Sizes.size14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                size: Sizes.size20,
              ),
            ),
          ),
        );
      case LeadingType.cancel:
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InitialScreen(),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: Sizes.size14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ),
        );
      case LeadingType.none:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.leadingType});

  final LeadingType leadingType;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Icon(
        FontAwesomeIcons.twitter,
        color: Theme.of(context).primaryColor,
        size: Sizes.size28,
      ),
      leading: leadingType.intoWidget(context),
      leadingWidth: Sizes.size80,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

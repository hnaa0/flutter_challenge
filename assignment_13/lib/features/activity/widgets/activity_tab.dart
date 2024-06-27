import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<SettingsThemeModeViewModel>().darkMode;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      width: 110,
      decoration: BoxDecoration(
        color: isDark
            ? isSelected
                ? const Color(ThemeColors.extraExtraLightGray)
                : const Color(0xFF2F363D)
            : isSelected
                ? Colors.black
                : Colors.white,
        border: !isSelected
            ? isDark
                ? Border.all(
                    color: const Color(
                      ThemeColors.darkGray,
                    ),
                  )
                : Border.all(
                    color: const Color(
                      ThemeColors.extraLightGray,
                    ),
                  )
            : null,
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isDark
              ? isSelected
                  ? Colors.black
                  : Colors.white
              : isSelected
                  ? Colors.white
                  : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}

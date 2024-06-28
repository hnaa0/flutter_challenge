import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTab extends ConsumerWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingsThemeModeProvider).darkMode;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: isSelected ? 1 : 0.25,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: FaIcon(
                  icon,
                  color: isDark
                      ? const Color(ThemeColors.extraLightGray)
                      : Colors.black,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

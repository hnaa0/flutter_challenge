import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/interests.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/screens/interests_part2_screen.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/next_button.dart';
import 'package:assignment_11/features/auth/widgets/vertical_scroll_card.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedItemList = [];

  void onInterestTap({required String item}) {
    setState(() {
      if (!_selectedItemList.contains(item)) {
        _selectedItemList.add(item);
      } else {
        _selectedItemList.remove(item);
      }
    });
  }

  void _onNextTap() {
    if (_selectedItemList.length < 3) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            InterestsPart2Screen(selectedMain: _selectedItemList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size8,
            // horizontal: Sizes.size28,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size28,
                ),
                child: MainSubTextPack(
                  main: "What do you want to see on Twitter?",
                  sub:
                      "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                ),
              ),
              Gaps.v16,
              const Divider(
                thickness: 1,
                color: Color(
                  ThemeColors.extraLightGray,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size32,
                    horizontal: Sizes.size16,
                  ),
                  itemCount: interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Sizes.size10,
                    crossAxisSpacing: Sizes.size10,
                    childAspectRatio: 2 / 1,
                  ),
                  itemBuilder: (context, index) {
                    var main = interests[index].main;
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 2 / 1,
                          child: GestureDetector(
                            onTap: () => onInterestTap(item: main),
                            child: VerticalScrollCard(
                              isSelected: _selectedItemList.contains(main),
                              text: main,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: const Color(ThemeColors.extraExtraLightGray),
        elevation: 0,
        child: GestureDetector(
          onTap: _onNextTap,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gaps.h8,
              Text(
                _selectedItemList.length < 3
                    ? "${_selectedItemList.length} of 3 selected"
                    : "Great work🥳",
                style: TextStyle(
                  color: const Color(ThemeColors.black).withOpacity(0.7),
                ),
              ),
              const Spacer(),
              NextButton(
                isValid: _selectedItemList.length > 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

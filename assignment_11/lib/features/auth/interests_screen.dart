import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/interest_card.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';
import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  static List<String> interestList = [
    "Fashion & beauty",
    "Outdoor",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Animal",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Politics"
  ];

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedItemList = [];
  final List<bool> _isSelectedList =
      List.filled(InterestsScreen.interestList.length, false);

  void onInterestTap({required String item, required int index}) {
    setState(() {
      if (!_selectedItemList.contains(item)) {
        _selectedItemList.add(item);
      } else {
        _selectedItemList.remove(item);
      }

      _isSelectedList[index] = !_isSelectedList[index];
    });
  }

  void _onNextTap() {
    if (_selectedItemList.length < 3) return;
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
                  itemCount: InterestsScreen.interestList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Sizes.size10,
                    crossAxisSpacing: Sizes.size10,
                    childAspectRatio: 2 / 1,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: GestureDetector(
                          onTap: () => onInterestTap(
                            item: InterestsScreen.interestList[index],
                            index: index,
                          ),
                          child: InterestCard(
                            isSelected: _isSelectedList[index],
                            text: InterestsScreen.interestList[index],
                          ),
                        ),
                      )
                    ],
                  ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size6),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: const EdgeInsets.symmetric(
                      // vertical: Sizes.size16,
                      // horizontal: Sizes.size28,
                      ),
                  decoration: BoxDecoration(
                    color: _selectedItemList.length > 2
                        ? const Color(ThemeColors.black)
                        : const Color(ThemeColors.lightGray),
                    borderRadius: BorderRadius.circular(Sizes.size28),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:assignment_11/constants/colors.dart';
import 'package:assignment_11/constants/gaps.dart';
import 'package:assignment_11/constants/sizes.dart';
import 'package:assignment_11/constants/interests.dart';
import 'package:assignment_11/features/auth/widgets/app_bar.dart';
import 'package:assignment_11/features/auth/widgets/horizontal_scroll_card.dart';
import 'package:assignment_11/features/auth/widgets/main_sub_text_pack.dart';
import 'package:assignment_11/features/auth/widgets/next_button.dart';
import 'package:flutter/material.dart';

class InterestsPart2Screen extends StatefulWidget {
  const InterestsPart2Screen({
    super.key,
    required this.selectedMain,
  });

  final List<String> selectedMain;

  @override
  State<InterestsPart2Screen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsPart2Screen> {
  final List<String> _selectedItemList = [];

  void _onInterestTap({required String item}) {
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
                      "Interests are used to personalize your experience and will be visible on your profile.",
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
                child: ListView.separated(
                  itemCount: widget.selectedMain.length,
                  itemBuilder: (context, index) {
                    var mainInterest = widget.selectedMain[index];
                    var subInterests = interests
                        .firstWhere((element) => element.main == mainInterest)
                        .sub;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mainInterest,
                            style: const TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gaps.v10,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 1.5,
                              child: Wrap(
                                spacing: Sizes.size8,
                                runSpacing: Sizes.size8,
                                children: [
                                  for (var item in subInterests)
                                    GestureDetector(
                                      onTap: () => _onInterestTap(item: item),
                                      child: HorizontalScrollCard(
                                        text: item,
                                        isSelected:
                                            _selectedItemList.contains(item),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Color(
                        ThemeColors.extraLightGray,
                      ),
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

import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/home/widgets/ellipsis_bottom_sheet_report.dart';
import 'package:flutter/material.dart';

class EllipsisBottomSheet extends StatefulWidget {
  const EllipsisBottomSheet({super.key});

  @override
  State<EllipsisBottomSheet> createState() => _EllipsisBottomSheetState();
}

class _EllipsisBottomSheetState extends State<EllipsisBottomSheet> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onReportTap() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void _onBackTap() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size20,
        right: Sizes.size20,
        bottom: Sizes.size16,
      ),
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        height: _currentPage == 0 ? 270 : 400,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) => _onPageChanged(value),
          children: [
            Visibility(
              visible: _currentPage == 0,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(Sizes.size20),
                    ),
                    child: const Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Unfollow",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: Sizes.size1,
                          color: Color(ThemeColors.extraLightGray),
                        ),
                        ListTile(
                          title: Text(
                            "Mute",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.v16,
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(Sizes.size20),
                    ),
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            "Hide",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: Sizes.size1,
                          color: Color(ThemeColors.extraLightGray),
                        ),
                        ListTile(
                          onTap: _onReportTap,
                          title: const Text(
                            "Report",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _currentPage != 0,
              child: EllipsisBottomSheetReport(
                onBackTap: _onBackTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

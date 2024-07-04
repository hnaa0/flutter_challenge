import 'dart:io';

import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WirteThreadImageListView extends StatelessWidget {
  const WirteThreadImageListView({
    super.key,
    required this.selectedList,
    required this.deletePhoto,
  });

  final List<File> selectedList;
  final Function deletePhoto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: selectedList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Sizes.size12,
                  ),
                ),
                child: Image.file(
                  File(
                    selectedList[index].path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 8,
                top: 6,
                child: GestureDetector(
                  onTap: () => deletePhoto(selectedList[index]),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(
                      Sizes.size6,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(ThemeColors.darkGray).withOpacity(0.5),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.xmark,
                      color: Colors.white,
                      size: Sizes.size16,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Gaps.h8,
      ),
    );
  }
}

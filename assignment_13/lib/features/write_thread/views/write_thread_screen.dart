import 'dart:async';
import 'dart:io';

import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/settings/view_models/theme_mode_view_model.dart';
import 'package:assignment_13/features/write_thread/views/camera_screen.dart';
import 'package:assignment_13/features/write_thread/widgets/write_thread_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WriteThreadScreen extends StatefulWidget {
  const WriteThreadScreen({super.key});

  @override
  State<WriteThreadScreen> createState() => _WriteThreadScreenState();
}

class _WriteThreadScreenState extends State<WriteThreadScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _text = "";
  final List<String> _selectedList = [];

  Future<void> _onCameraTap() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    ).then(
      (value) {
        if (value != null && mounted) {
          for (var item in value) {
            _selectedList.add(item.path);
          }

          setState(() {});
        }
      },
    );
  }

  void _onDeletePhotoTap(String file) {
    setState(() {
      _selectedList.remove(file);
    });
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _text = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<SettingsThemeModeViewModel>().darkMode;
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizes.size24),
            topRight: Radius.circular(Sizes.size24),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "New thread",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            leading: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _focusNode.unfocus();
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(
                  left: Sizes.size20,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            ),
            leadingWidth: 80,
            shape: Border(
              bottom: BorderSide(
                color: isDark
                    ? const Color(ThemeColors.darkGray)
                    : const Color(
                        ThemeColors.extraLightGray,
                      ),
                width: 1,
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size16,
            ),
            color: isDark ? const Color(ThemeColors.black) : Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                Sizes.size1,
                              ),
                              width: Sizes.size48,
                              height: Sizes.size48,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                  ThemeColors.lightGray,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/avatar.jpg"),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size6,
                                ),
                                child: VerticalDivider(
                                  thickness: Sizes.size2,
                                  color: isDark
                                      ? const Color(ThemeColors.darkGray)
                                      : const Color(
                                          ThemeColors.extraLightGray,
                                        ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.6,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  Sizes.size1,
                                ),
                                width: Sizes.size20,
                                height: Sizes.size20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(
                                    ThemeColors.lightGray,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.jpg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.h12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "gnar_",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  focusNode: _focusNode,
                                  controller: _textController,
                                  decoration: const InputDecoration(
                                    hintText: "Start a thread...",
                                    hintStyle: TextStyle(
                                      color: Color(
                                        ThemeColors.lightGray,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              if (_selectedList.isNotEmpty) ...[
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _selectedList.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Sizes.size12,
                                              ),
                                            ),
                                            child: Image.file(
                                              File(
                                                _selectedList[index],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 6,
                                            child: GestureDetector(
                                              onTap: () => _onDeletePhotoTap(
                                                  _selectedList[index]),
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(
                                                  Sizes.size6,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: const Color(
                                                          ThemeColors.darkGray)
                                                      .withOpacity(0.5),
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
                                    separatorBuilder: (context, index) =>
                                        Gaps.h8,
                                  ),
                                ),
                                Gaps.v8,
                              ],
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: _onCameraTap,
                                child: const Padding(
                                  padding: EdgeInsets.all(2),
                                  child: FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    color: Color(
                                      ThemeColors.lightGray,
                                    ),
                                    size: Sizes.size20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: WriteThreadBottomAppBar(text: _text),
        ),
      ),
    );
  }
}

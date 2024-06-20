import 'package:assignment_13/constants/colors.dart';
import 'package:assignment_13/constants/gaps.dart';
import 'package:assignment_13/constants/sizes.dart';
import 'package:assignment_13/features/write_thread/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteThreadScreen extends StatefulWidget {
  const WriteThreadScreen({super.key});

  @override
  State<WriteThreadScreen> createState() => _WriteThreadScreenState();
}

class _WriteThreadScreenState extends State<WriteThreadScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _text = "";

  void _onCameraTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            shape: const Border(
              bottom: BorderSide(
                color: Color(
                  ThemeColors.extraLightGray,
                ),
                width: 1,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size16,
            ),
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
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizes.size6,
                              ),
                              child: VerticalDivider(
                                thickness: Sizes.size2,
                                color: Color(
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
                            GestureDetector(
                              onTap: _onCameraTap,
                              child: const FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: Color(
                                  ThemeColors.lightGray,
                                ),
                                size: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Anyone can reply",
                      style: TextStyle(
                        color: Color(
                          ThemeColors.lightGray,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: const Color(
                            ThemeColors.twitterBlue,
                          ).withOpacity(_text != "" ? 1 : 0.5),
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

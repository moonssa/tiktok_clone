import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  void _onClodePressed() {
    Navigator.of(context).pop();
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = isDarkMode(context);
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: isDark ? null : Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: Text(S.of(context).commentTitle(2555998, 2555998)),
          actions: [
            IconButton(
              onPressed: _onClodePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _onStopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    left: Sizes.size16,
                    right: Sizes.size16,
                    top: Sizes.size10,
                    bottom: Sizes.size96 + Sizes.size28,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemBuilder: (context, index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: isDark ? Colors.grey.shade500 : null,
                        foregroundColor: isDark ? Colors.black : null,
                        child: const Text(
                          "문경",
                        ),
                      ),
                      Gaps.h20,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("gmapsfun • Creator",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500,
                                )),
                            const Text(
                                "Pinned Location: Wharariki abc  def  lgh Beachsdklfs;lfkds;lk,"),
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.v2,
                          const Text("52.2K"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  surfaceTintColor: Colors.white,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade400,
                        foregroundColor: Colors.white,
                        child: const Text(
                          "문경",
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size40,
                          child: TextField(
                            onTap: _onStartWriting,
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            textInputAction: TextInputAction.newline,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              hintText: "Add comment...",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.circular(Sizes.size12),
                              ),
                              filled: true,
                              fillColor: isDark
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade200,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.at,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade800,
                                    ),
                                    Gaps.h10,
                                    FaIcon(
                                      FontAwesomeIcons.gift,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade800,
                                    ),
                                    Gaps.h10,
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade800,
                                    ),
                                    Gaps.h10,
                                    if (_isWriting)
                                      FaIcon(
                                        FontAwesomeIcons.circleArrowUp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

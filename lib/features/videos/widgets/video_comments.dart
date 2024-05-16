import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClodePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
              onPressed: _onClodePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
                vertical: Sizes.size10,
              ),
              itemCount: 10,
              separatorBuilder: (context, index) => Gaps.v20,
              itemBuilder: (context, index) => Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    child: Text(
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
                      child: TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: "Add comment...",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(Sizes.size12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                            horizontal: Sizes.size12,
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
    );
  }
}

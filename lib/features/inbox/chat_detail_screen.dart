import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _isWring = false;

  void _onStartWriting() {
    setState(() {
      _isWring = true;
    });
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWring = false;
    });
  }

  void _onSubmitted(String value) {
    setState(() {
      _isWring = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/90151845?v=4"),
                radius: Sizes.size20,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3)),
                ),
              )
            ],
          ),
          title: const Text(
            "xxxxmmm967",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h20,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _onStopWriting,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final bool isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            isMine ? Sizes.size5 : Sizes.size20,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Congratulations!!",
                        style: TextStyle(
                            color: Colors.white, fontSize: Sizes.size16),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              bottom: -10,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                elevation: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Sizes.size40,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: Sizes.size10,
                        // ),
                        child: TextField(
                          onTap: _onStartWriting,
                          onSubmitted: _onSubmitted,
                          decoration: const InputDecoration(
                            hintText: "Send a message",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.size20),
                                topRight: Radius.circular(Sizes.size20),
                                bottomLeft: Radius.circular(Sizes.size20),
                                bottomRight: Radius.circular(Sizes.size5),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                                horizontal: Sizes.size20),
                            filled: true,
                            fillColor: Colors.white,
                            // contentPadding: EdgeInsets.symmetric(horizontal: Sizes.size12,),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Sizes.size10,
                                  horizontal: Sizes.size10),
                              child: FaIcon(
                                FontAwesomeIcons.faceSmile,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: _isWring ? Colors.black : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

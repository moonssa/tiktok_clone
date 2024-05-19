import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct Message"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: Sizes.size32,
              foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/90151845?v=4"),
              child: Text("문경"),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "AntonioBM",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "2:16 PM",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Sizes.size14,
                  ),
                ),
              ],
            ),
            subtitle: const Text("Say hi to AntonioBM"),
          )
        ],
      ),
    );
  }
}

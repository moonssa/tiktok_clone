import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final List<int> _items = [];
  final Duration _duration = const Duration(
    milliseconds: 300,
  );
  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );
      _items.add(_items.length);
    }
  }

  void _onDeleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(color: Colors.red, child: _makeTile(index)),
        ),
        duration: _duration,
      );
      _items.removeAt(index);
    }
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _onDeleteItem(index),
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
          Text(
            "Moon -- ($index)",
            style: const TextStyle(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct Message"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: _makeTile(
                  index,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Home"),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.grey,

        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            tooltip: "Go home",
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            tooltip: "What do you serach?",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            tooltip: "Go home",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            tooltip: "What do you serach?",
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            tooltip: "Go home",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

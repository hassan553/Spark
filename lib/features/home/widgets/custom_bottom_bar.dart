import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';

class BottomBarWidget extends StatelessWidget {
  final Function function;
  final int index;
  const BottomBarWidget(
      {super.key, required this.function, required this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        function(index);
      },
      backgroundColor: const Color(0xffA4A4A4),
      
      currentIndex: index,
      
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        ),
      ],
    );
  }
}

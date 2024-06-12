import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 40,
      selectedItemColor: Color.fromARGB(235, 105, 57, 251),
      unselectedItemColor: Color.fromARGB(255, 135, 134, 134),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.linear_scale_outlined ,size: 0, ), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.signal_cellular_alt), label: "Report")
      ],
    );
  }
}

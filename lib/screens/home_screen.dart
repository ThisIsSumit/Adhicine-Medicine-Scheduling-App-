import 'package:flutter/material.dart';
import 'package:medicine_app/models/custom_bottom_navigataionbar.dart';
import 'package:medicine_app/pages.dart/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "Home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: HomePage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.large(
          elevation: 12,
          shape: const StadiumBorder(),
          onPressed: () {
            //navigate to add medicine
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:medicine_app/models/custon_navigationbar.dart';

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: const StadiumBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const customNavigationBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medicine_app/pages.dart/home_page.dart';
import 'package:medicine_app/pages.dart/report_page.dart';
import 'package:medicine_app/screens/add_medicine.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "Home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Widget _currentPage = const HomePage();
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      if (index == 0) {
        _currentPage = const HomePage();
      } else if (index == 1) {
        _currentPage = const ReportScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(child: _currentPage),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        elevation: 12,
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.pushNamed(context, AddMedicineScreen.id);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int value) {
          changePage(value);
          currentIndex = value;
        },
        iconSize: 35,
        selectedItemColor: const Color.fromARGB(235, 105, 57, 251),
        unselectedItemColor: const Color.fromARGB(255, 135, 134, 134),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.signal_cellular_alt), label: "Report")
        ],
      ),
    );
  }
}

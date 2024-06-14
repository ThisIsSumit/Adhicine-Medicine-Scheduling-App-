import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});
  static String id = "Report_screen";

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Report", style: kheadingStyle),
          ),
          SizedBox(
            height: 100,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Today's Report"),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("DashBoard Card"),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

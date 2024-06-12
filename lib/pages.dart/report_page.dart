import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});
  static String id = "Report_screen";

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Report", style: kheadingStyle),
        Card(
          child: Column(
            children: [
              Text("Today's Report"),
              Row(
                children: [],
              )
            ],
          ),
        )
      ],
    );
  }
}

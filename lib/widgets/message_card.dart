import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        surfaceTintColor: Color.fromARGB(255, 140, 0, 255),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("image"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Calpol 500mg Tablet",
                  style: kcarHeadingStyle,
                ),
                Text(
                  "Before Beakfast  Day 01",
                  style: kcontentStyle,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.baby_changing_station), Text("Taken")],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';
import 'package:medicine_app/widgets/message_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MessageCard> _afterNoonMedicines = [MessageCard(), MessageCard()];
    List<MessageCard> _morningMedicines = [MessageCard()];
    List<MessageCard> _nightMedicines = [
      MessageCard(),
      MessageCard(),
      MessageCard()
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Harry!", style: kheadingStyle),
                      Text(
                        "5 Medicine Left",
                        style: ksubheadingStyle,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.medical_services,
                        size: 30,
                        color: Color.fromARGB(193, 105, 57, 251),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Row(
            children: [Text("date")],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Night Timimg",
                  style: klabelStyle,
                ),
                Column(
                  children: _afterNoonMedicines,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "AfterNoon Timimg",
                  style: klabelStyle,
                ),
                Column(
                  children: _afterNoonMedicines,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Night Timimg",
                  style: klabelStyle,
                ),
                Column(
                  children: _nightMedicines,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

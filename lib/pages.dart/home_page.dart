import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';
import 'package:medicine_app/widgets/message_card.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

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
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
            activeColor: const Color(0xff37306B),
            headerProps: const EasyHeaderProps(
              dateFormatter: DateFormatter.fullDateDayAsStrMY(),
            ),
            dayProps: const EasyDayProps(
              height: 50,
              activeDayStyle: DayStyle(
                borderRadius: 32.0,
              ),
              inactiveDayStyle: DayStyle(
                borderRadius: 32.0,
              ),
            ),
            timeLineProps: const EasyTimeLineProps(
              hPadding: 16.0, // padding from left and right
              separatorPadding: 16.0, // padding between days
            ),
            itemBuilder: (
              BuildContext context,
              DateTime date,
              bool isSelected,
              VoidCallback onTap,
            ) {
              return InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  padding: isSelected
                      ? const EdgeInsets.symmetric(horizontal: 8.0)
                      : null,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xff37306B) : null,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Expanded(
                    child: Center(
                      child: Text(
                        isSelected
                            ? "${EasyDateFormatter.fullDayName(date, "en_US")}, ${EasyDateFormatter.shortMonthName(date, "en_US")} ${date.day.toString()} "
                            : EasyDateFormatter.shortDayName(date, "en_US"),
                        style: TextStyle(
                          fontSize: 20,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xff6D5D6E),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
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
                const Text(
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
                const Text(
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

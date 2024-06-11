import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("No Internet Connection",
                style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ),
        content: SizedBox(
          child: Image.asset("assets/images/errorBot.png"),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(193, 105, 57, 251),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bluetooth),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(193, 105, 57, 251),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.wifi),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

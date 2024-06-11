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
          child: Image.asset(
            "assets/images/errorBot.png",
            fit: BoxFit.fill,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: Material(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: const Color.fromARGB(193, 105, 57, 251),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.bluetooth),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: Material(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                  ),
                  color: const Color.fromARGB(193, 105, 57, 251),
                  child: TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.wifi,
                      color: Colors.white,
                    ),
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

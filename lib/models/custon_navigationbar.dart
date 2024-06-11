import 'package:flutter/material.dart';

class customNavigationBar extends StatelessWidget {
  const customNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
              ),
              const Expanded(child: Text("Home"))
            ],
          ),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.signal_cellular_alt),
                ),
              ),
              const Expanded(
                child: Text("Report"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

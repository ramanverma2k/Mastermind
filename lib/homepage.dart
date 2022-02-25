import 'package:flutter/material.dart';
import 'package:mastermind/board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.refresh_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.help_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Board(),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.white),
              ),
              onPressed: () {},
              child: const Text(
                'Check',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Styling App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Flutter Text Styling",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Experiment with text styles",
              style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  final stkbr =
                      SnackBar(content: Text("You clicked the button!"));
                  ScaffoldMessenger.of(context).showSnackBar(stkbr);
                },
                child: const Text("Click Me")),
            RichText(
              text: const TextSpan(
                text: 'Welcome to ',
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Flutter!',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

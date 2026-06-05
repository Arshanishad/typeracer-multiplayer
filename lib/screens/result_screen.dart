import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String winner;
  final double wpm;
  final double accuracy;

  const ResultScreen({
    super.key,
    required this.winner,
    required this.wpm,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🏆 Winner: $winner",
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            Text("Speed: ${wpm.toStringAsFixed(1)} WPM"),
            Text("Accuracy: ${accuracy.toStringAsFixed(1)}%"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Back to Home"),
            )
          ],
        ),
      ),
    );
  }
}
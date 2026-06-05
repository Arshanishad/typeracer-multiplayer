import 'dart:async';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final String text =
      "Flutter is an open source UI framework by Google.";
  final TextEditingController controller = TextEditingController();

  double progress = 0;
  int timeLeft = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        t.cancel();
        // TODO: Navigate to result screen
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  void checkTyping(String value) {
    int correct = 0;

    for (int i = 0; i < value.length; i++) {
      if (i < text.length && value[i] == text[i]) {
        correct++;
      }
    }

    setState(() {
      progress = correct / text.length;
    });

    // TODO: send progress via socket
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time: $timeLeft"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(text, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),

            LinearProgressIndicator(value: progress),

            const SizedBox(height: 20),

            TextField(
              controller: controller,
              onChanged: checkTyping,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Start typing...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
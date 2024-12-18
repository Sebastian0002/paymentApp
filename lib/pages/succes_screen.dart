import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({super.key});

  static String route = "/success_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Succes Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.solidStarHalfStroke,
                size: 80, color: Colors.blue[800]),
            const SizedBox(height: 40),
            const Text("Payment successfully made!",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Widgets/Display.dart';
import 'Widgets/NumPad.dart';
import 'Compute/Compute.dart';

// Widget to render whole App
class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppView();
}

class _AppView extends State<AppView> {
  final compute = Compute();

  void buttonPress(String str) {
    setState(() {
      compute.registerButton(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DisplayWidget(
                compute.displayValue,
                compute.currentOp(),
                compute.equation,
              ),
              const SizedBox(
                height: 40,
              ),
              NumPad(buttonPress),
            ],
          ),
        ),
      ),
    );
  }
}

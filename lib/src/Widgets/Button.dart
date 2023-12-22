import 'package:flutter/material.dart';

// Widget for rendering each button
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.name, this.func, {super.key});

  final String name;
  final void Function() func;

  Color? getColor() {
    switch (name) {
      case '+' || '-' || 'x' || '÷' || '^':
        return Colors.lightGreen[500];

      case 'AC' || 'C' || '%':
        return Colors.deepOrange[300];

      case '=':
        return Colors.teal[300];

      default:
        return Colors.amberAccent[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: func,
      style: TextButton.styleFrom(
        backgroundColor: getColor(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

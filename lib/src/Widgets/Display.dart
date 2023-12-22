import 'package:flutter/material.dart';

// Widget for rendering the display module of the calculator
class DisplayWidget extends StatelessWidget {
  const DisplayWidget(this.str, this.op, this.eqn, {super.key});

  final String str;
  final String eqn;
  final String op;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "OP: $op",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$eqn : EQN",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                str,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

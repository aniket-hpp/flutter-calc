import 'Button.dart';
import 'package:flutter/material.dart';

// Widget to render the whole numpad of the calculator
class NumPad extends StatelessWidget {
  NumPad(this.func, {super.key});

  final void Function(String) func;
  final List<List<String>> buttonLayout = [
    [
      'AC',
      'C',
      '%',
      '÷'
    ],
    [
      '7',
      '8',
      '9',
      'x'
    ],
    [
      '4',
      '5',
      '6',
      '-'
    ],
    [
      '1',
      '2',
      '3',
      '+'
    ],
    [
      '0',
      '.',
      '=',
      '^'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var row in buttonLayout)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var item in row) ButtonWidget(item, () => func(item))
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )
      ],
    );
  }
}

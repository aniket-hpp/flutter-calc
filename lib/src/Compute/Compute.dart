import '../StackDS/Stack.dart';
import 'dart:math';

// module to compute the calculator operations
class Compute {
  final _oprt = Stack<String>();
  final _oprnd = Stack<String>();

  String displayValue = "0";
  String equation = "";
  bool newNumber = false;

  void setNum(String ch) {
    if (displayValue == "0" && ch == "0") {
      return;
    } else if (displayValue == "0" || displayValue == "Infinity" || newNumber) {
      displayValue = ch;
      newNumber = false;
    } else {
      displayValue += ch;
    }
  }

  void setOperator(String op) {
    if (!newNumber) {
      if (_oprt.isEmpty()) {
        _oprnd.push(displayValue);
        _oprt.push(op);
      } else if (!_oprnd.isEmpty()) {
        var prev_op = _oprt.pop();
        var snum1 = _oprnd.pop();

        num num1 = num.parse(snum1);
        num num2 = num.parse(displayValue);
        num result = 0;
        equation = "$snum1 $prev_op $displayValue";

        switch (prev_op) {
          case '+':
            result = num1 + num2;
            break;

          case '-':
            result = num1 - num2;
            break;

          case 'x':
            result = num1 * num2;
            break;

          case '÷':
            result = num1 / num2;
            break;

          case '^':
            result = pow(num1, num2);
            break;
        }

        displayValue = "$result";
        _oprnd.push(displayValue);
      }

      if (op == ' ') {
        _oprt.reset();
        newNumber = false;
      } else {
        _oprt.push(op);
        newNumber = true;
      }
    } else {
      if (!_oprt.isEmpty()) {
        _oprt.pop();
        _oprt.push(op);
      }
    }
  }

  void registerButton(String ch) {
    switch (ch) {
      case '+' || '-' || 'x' || '÷' || '^':
        setOperator(ch);
        break;

      case 'AC':
        _oprt.reset();
        _oprnd.reset();
        displayValue = "0";
        equation = "";
        newNumber = false;
        break;

      case 'C':
        newNumber = false;
        if (!_oprt.isEmpty()) _oprt.pop();
        break;

      case '=':
        if (!_oprt.isEmpty()) {
          setOperator(' ');
        }
        break;

      case '.':
        if (!displayValue.contains('.')) {
          displayValue += '.';
        }

      case '%':
        if (displayValue != "0") {
          var numval = num.parse(displayValue);
          numval /= 100;
          displayValue = "$numval";
        }

      default:
        setNum(ch);
    }
  }

  String currentOp() {
    if (!_oprt.isEmpty()) {
      return _oprt.peek();
    }

    return "";
  }
}

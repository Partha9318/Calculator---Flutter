import 'dart:math';

import 'package:calculator/entry.dart';
import 'package:flutter/material.dart';
import 'buttonDesign.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String txtToDisplay = '';
  late String res;
  late String operation;
  void btnOnClick(String btnVal) {
    if (btnVal == 'AC') {
      txtToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '/' ||
        btnVal == 'x' ||
        btnVal == '%') {
      firstNum = int.parse(txtToDisplay);
      res = '';
      operation = btnVal;
      history = firstNum.toString() + operation.toString();
    } else if (btnVal == '=') {
      secondNum = int.parse(txtToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '%') {
        res = '${(firstNum * 100) / secondNum}%';
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else if (btnVal == '√') {
      firstNum = int.parse(txtToDisplay);
      res = sqrt(firstNum).toString();
      history = operation.toString() + firstNum.toString();
    } else if (btnVal == 'bksp') {
      res = txtToDisplay.substring(0, txtToDisplay.length - 1);
    } else if (btnVal == 'sqr') {
      firstNum = int.parse(txtToDisplay);
      res = (firstNum * firstNum).toString();
      history = '$firstNum\u00B2';
    }
    //input for res
    else {
      res = int.parse(txtToDisplay + btnVal).toString();
      setState(() {});
    }
    txtToDisplay = res;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 68, 68, 68),
          elevation: 0,
        ),
        body: Container(
            alignment: Alignment(1, 1),
            color: const Color.fromARGB(255, 68, 68, 68),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(keepScrollOffset: true),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //Text Here
                          Entry(txtToDisplay, history),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => btnOnClick('AC'),
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.purple[100],
                          backgroundColor: Color.fromARGB(255, 66, 46, 70),
                          shape: const CircleBorder(),
                        ),
                        child: const Text('AC'),
                      ),
                      TextButton(
                        onPressed: () => {btnOnClick('sqr')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('X\u00B2'),
                      ),
                      TextButton(
                        onPressed: () => btnOnClick('%'),
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('%'),
                      ),
                      TextButton(
                        onPressed: () => {btnOnClick("√")},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('√'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        '7',
                        btnOnClick,
                      ),
                      Button('8', btnOnClick),
                      Button('9', btnOnClick),
                      TextButton(
                        onPressed: () => {btnOnClick('x')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('x'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button('4', btnOnClick),
                      Button('5', btnOnClick),
                      Button('6', btnOnClick),
                      TextButton(
                        onPressed: () => {btnOnClick('-')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('-'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button('1', btnOnClick),
                      Button('2', btnOnClick),
                      Button('3', btnOnClick),
                      TextButton(
                        onPressed: () => {btnOnClick('+')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Text('+'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button('0', btnOnClick),
                      Button('.', btnOnClick),
                      TextButton(
                        onPressed: () => {btnOnClick('bksp')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor: Colors.redAccent,
                          backgroundColor: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.backspace),
                      ),
                      TextButton(
                        onPressed: () => {btnOnClick('=')},
                        style: TextButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          foregroundColor:
                              const Color.fromARGB(255, 169, 165, 233),
                          backgroundColor:
                              const Color.fromARGB(255, 48, 47, 61),
                          shape: const CircleBorder(),
                        ),
                        child: const Text('='),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

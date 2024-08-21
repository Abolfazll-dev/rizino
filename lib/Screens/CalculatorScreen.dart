import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/Screens/constants.dart';

class CalculatorApplication extends StatefulWidget {
  const CalculatorApplication({Key? key}) : super(key: key);

  @override
  _CalculatorApplicationState createState() => _CalculatorApplicationState();
}

class _CalculatorApplicationState extends State<CalculatorApplication> {
  var inputUser = '';
  var result = '';

  void buttonPressed(String text) {
    setState(() {
      inputUser = inputUser + text;
    });
  }

  Widget getRow(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            if (text1 == 'ac') {
              setState(() {
                inputUser = '';
                result = '';
              });
            } else {
              buttonPressed(text1);
            }
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: (text1 == 'ac')
                    ? const Color.fromARGB(0, 238, 238, 238)
                    : CustomColors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: getTextColor(text1),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (text2 == 'ce') {
              setState(() {
                if (inputUser.length > 0) {
                  inputUser = inputUser.substring(0, inputUser.length - 1);
                }
              });
            } else {
              buttonPressed(text2);
            }
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: (text1 == 'ac')
                    ? const Color.fromARGB(0, 238, 238, 238)
                    : CustomColors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: getTextColor(text2),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            buttonPressed(text3);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: (text1 == 'ac')
                    ? const Color.fromARGB(0, 238, 238, 238)
                    : CustomColors.blue,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                text3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: getTextColor(text3),
                ),
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              shape: const CircleBorder(
                side: BorderSide(width: 0, color: Colors.transparent),
              ),
              backgroundColor: getBackgroundColor(text4)),
          onPressed: () {
            if (text4 == '=') {
              Parser parser = Parser();
              Expression expression = parser.parse(inputUser);
              ContextModel contextModel = ContextModel();
              double eval =
                  expression.evaluate(EvaluationType.REAL, contextModel);
              setState(() {
                result = eval.toString();
              });
            } else {
              buttonPressed(text4);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              text4,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: getTextColor(text4),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: CustomColors.backgroundScreenColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: CustomColors.backgroundScreenColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(115, 0, 0, 0),
                                  blurRadius: 20,
                                  spreadRadius: -10)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'تبدیل ارز ها',
                          style: TextStyle(fontFamily: 'irm', fontSize: 13),
                        )),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(115, 0, 0, 0),
                                  blurRadius: 20,
                                  spreadRadius: -10)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'محاسبه گر مهریه',
                          style: TextStyle(fontFamily: 'irm', fontSize: 13),
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 100,
                  color: CustomColors.backgroundScreenColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          inputUser,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: textGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          result,
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 62,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    color: backgroundGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getRow('ac', 'ce', '%', '/'),
                        getRow('7', '8', '9', '*'),
                        getRow('4', '5', '6', '-'),
                        getRow('1', '2', '3', '+'),
                        getRow('00', '0', '.', '='),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String text) {
    var list = ['ac', 'ce', '%', '/', '*', '-', '+', '='];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }

    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOperator(text)) {
      return backgroundGreyDark;
    } else {
      return backgroundGrey;
    }
  }

  Color getTextColor(String text) {
    if (isOperator(text)) {
      return textGreen;
    } else {
      return textGrey;
    }
  }

}

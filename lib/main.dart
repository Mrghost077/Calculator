import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
   MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size= 0;
  String inputValue = "";
  String calculatedValue = "";
  String operator = "";
  double memoryPlus = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width/7;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              child: Text(inputValue,
              style: TextStyle(
                color: Colors.white,
                fontSize: 100
              ),),
            ),
            Row(
              children: [
               calcButton("7", Colors.white38),
               calcButton("8", Colors.white38),
               calcButton("9", Colors.white38),
               calcButton("/", Colors.orange),
               calcButton("C", Colors.orange)
              ],
            ),
            Row(
              children: [
               calcButton("4", Colors.white38),
               calcButton("5", Colors.white38),
               calcButton("6", Colors.white38),
               calcButton("*", Colors.orange),
               calcButton("AC", Colors.orange)
              ],
            ),
             Row(
              children: [
               calcButton("1", Colors.white38),
               calcButton("2", Colors.white38),
               calcButton("3", Colors.white38),
               calcButton("-", Colors.orange),
               calcButton("m+", Colors.orange),
              ],
            ),
             Row(
              children: [
               calcButton("0", Colors.white38),
               calcButton(".", Colors.white38),
               calcButton("=", Colors.white38),
               calcButton("+", Colors.orange),
               calcButton("mrc", Colors.orange),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgcolor){
    return InkWell(
      onTap: () {
        if (text == "C"){
          setState(() {
            inputValue = "";
          });
        }
        else if (text == "AC"){
          setState(() {
            calculatedValue = "";
            inputValue = "";
            operator = "";
            memoryPlus = 0;
          });
        }
        else if (text == "/" || text == "*" || text == "-" || text == "+"){
          calculatedValue = inputValue;
          inputValue = "";
          operator = text;
        }
        else if (text == "="){
          setState(() {
            double calc = double.parse(calculatedValue);
          double input = double.parse(inputValue);

          if (operator == "+"){
            inputValue = (calc + input).toString();
          }
          else if (operator == "-"){
            inputValue = (calc - input).toString();
          }
          else if (operator == "*"){
            inputValue = (calc * input).toString();
          }
          else if (operator == "/"){
            inputValue = (calc / input).toString();
          }
          });
        }
        else if (text == "m+"){
          setState(() {
            memoryPlus = memoryPlus + double.parse(inputValue);
            inputValue = "";
          });
        }
        else if (text == "mrc"){
          setState(() {
            inputValue = memoryPlus.toString();
          });
        }
        else{
        setState(() {
          inputValue = inputValue+text;
        });
        }
      },
      child: Container(
                    decoration: BoxDecoration(
                      color: bgcolor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: EdgeInsets.all(10),
                    height: size,
                    width: size,
                    alignment: Alignment.center,
                    child: Text(text,style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),),
                  ),
    );
  }
}

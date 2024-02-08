import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/const.dart';
import 'package:my_calculator/myButton.dart';

import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput= '';
  var answer= '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Scaffold(
          
          appBar: AppBar(
            centerTitle: true,
            title: Text("Nomii's Calculator", style: TextStyle(color: Colors.white),),
            backgroundColor: purpleCol,
          ) ,
          body:
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                          child: Text(answer.toString(), style: TextStyle(fontSize: 50,color: Colors.black),)),
                      Text(userInput.toString(), style: TextStyle(fontSize: 50, color: Colors.black),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: "00",
                        onPress: (){
                          userInput += "00";
                          setState(() {

                          });
                        },),
                        MyButton( title: "+/-",
                          onPress: (){
                            userInput += "+/-";
                            setState(() {

                            });
                          },),
                        MyButton(title: "/",
                          onPress: (){
                            userInput += "/";
                            setState(() {

                            });
                          },),
                        MyButton(title: "AC",
                          onPress: (){
                            userInput = "";
                            answer= "";
                            setState(() {

                            });
                          },
                          myColor: purpleCol,),


                      ],
                    ),
                    Row(
                      children: [
                        MyButton( title: "7",onPress: (){
                          userInput += "7";
                          setState(() {

                          });
                        },
                        ),
                        MyButton(title: "8",onPress: (){
                          userInput += "8";
                          setState(() {

                          });
                        },
                        ),
                        MyButton(title: "9",
                          onPress: (){
                            userInput += "9";
                            setState(() {

                            });
                          },),
                        MyButton(title: "+",
                          onPress: (){
                            userInput += "+";
                            setState(() {

                            });
                          },
                          myColor: purpleCol,),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton( title: "4",
                          onPress: (){
                            userInput += "4";
                            setState(() {

                            });
                          },),
                        MyButton(title: "5",
                          onPress: (){
                            userInput += "5";
                            setState(() {

                            });
                          },),
                        MyButton(title: "6",
                          onPress: (){
                            userInput += "6";
                            setState(() {

                            });
                          },),
                        MyButton(title: "-",
                          onPress: (){
                            userInput += "-";
                            setState(() {

                            });
                          },
                          myColor: purpleCol,),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton( title: "1",
                          onPress: (){
                            userInput += "1";
                            setState(() {

                            });
                          },),
                        MyButton(title: "2",
                          onPress: (){
                            userInput += "2";
                            setState(() {

                            });
                          },),
                        MyButton(title: "3",
                          onPress: (){
                            userInput += "3";
                            setState(() {

                            });
                          },),
                        MyButton(title: "x",
                          onPress: (){
                            userInput += "x";
                            setState(() {

                            });
                          },
                          myColor: purpleCol,
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton( title: "0",onPress: (){
                          userInput += "0";
                          setState(() {

                          });
                        },
                        ),
                        MyButton(title: ".",
                          onPress: (){
                            userInput += ".";
                            setState(() {

                            });
                          },),
                        MyButton(title: "=",
                          onPress: (){
                            equalPress();
                            setState(() {

                            });
                          },
                        ),
                        MyButton(title: "DEL",
                          onPress: (){
                             userInput= userInput.substring(0,userInput.length-1);
                             setState(() {

                             });
                          },
                          myColor: purpleCol,),

                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  void equalPress(){
    String FinaluserInput = userInput;
    FinaluserInput= userInput.replaceAll("x", "*");

    Parser p = Parser();
    Expression expression= p.parse(FinaluserInput);
    ContextModel contextModel=ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

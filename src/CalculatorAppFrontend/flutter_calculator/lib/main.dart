library flutter_calculator;

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'CalculatorButton.dart';

const String backendUrl = "http://localhost:8080/api/calculator/";

//Only evaluates the expression locally if explicitly stated with `--dart-define="EVAL_REMOTE=false"
//TODO: I'm having trouble comparing two constant strings ignoring case.
const String evalRemote = String.fromEnvironment("EVAL_REMOTE");
const bool evalLocal = (evalRemote == "false");




void main() {
  //print(EVAL_REMOTE);
  //print("Evaluating expressions " + (evalLocal ? "locally" : "remotely"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);
  // Initializes the app as a "Material Application"
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), //defines the default page / screen
    ); // MaterialApp
  }
}

// Classifies the home page as a widget that has a state.
// We need to do this because our page's contents change; The expression and calculated result need to be updated as the user interacts with the calculator.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bar along the top / title
      appBar: new AppBar(
        title: new Text("Flutter Calculator"),
        backgroundColor: Colors.green,
      ), //AppBar
      backgroundColor: Colors.green[900],


      // Body
      body: Column(
        children: <Widget>[
          // `Expanded` makes its contents fill all available space
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Displays the equation being input
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    // Displays the result of the equation
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]
              ),
            ),
          ),
          Expanded(
            flex: 3, // takes up the same space as 3 items
            child: Container(
              // Button Grid
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.black,
                      );
                    }

                    // +/- button
                    else if (index == 1) {
                      return CalculatorButton(
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.black,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button. Removes the last character in the expression
                    else if (index == 3) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            if(userInput.length > 0){
                              userInput = userInput.substring(0, userInput.length - 1);
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.yellow[200],
                        textColor: Colors.black,
                      );
                    }
                    // Equals Button. Evaluates the expression when pressed.
                    else if (index == 18) {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            calculateExpression();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }

                    // other buttons (Numbers, Operators)
                    else {
                      return CalculatorButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        // Changes color based on whether or not the button is for an operator.
                        // Non-Operators: White on Green
                        // Operators: White on Black
                        color: isOperator(buttons[index])
                            ? Colors.green
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }
                ), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  // Used to color the operator buttons a different color (see above)
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void calculateExpression() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
    finaluserinput = finaluserinput.replaceAll('/', 'd');

    if(evalLocal){
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    }else{

      answer = "Calculating...";
      late Future<String> evalResult = fetchEvaluatedResult(finaluserinput);


      evalResult.then((String result) {
        // print(result);
        setState((){answer = result;});

      }).catchError((error) {
        print(error);
        setState((){answer = "Unable to connect to eval servers!";});
      });


    }
  }
}


// sends a GET request to the backend, which evaluates the expression and returns the result
Future<String> fetchEvaluatedResult(String expression) async {
  // Send request and store repsonse locally
  String request = BACKEND_URL + "calculate/" + expression;
  // print("GET `"+request+"`");

  final response = await http.get(Uri.parse(request));

  // print("Response code: "+response.statusCode.toString());
  if(response.statusCode == 200){
    // print(response.body);
    // Get the result from the response and turn it into a string.
    return jsonDecode(response.body)['result'].toString();
  }else{
    return "Unable to connect to eval servers!";
  }
}

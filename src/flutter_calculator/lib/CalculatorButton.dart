library FlutterCalculator;

import 'package:flutter/material.dart';

// creating Stateless Widget for buttons, as even though interacting with them changes things, the buttons themselves do not change
class CalculatorButton extends StatelessWidget {
  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  //Constructor
  CalculatorButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttontapped}
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Widget that can detect actions involving it (touch, drag, etc.)
      onTap: buttontapped,
      child: Padding( // Puts a gap between buttons
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect( // Constraints its contents to a rectangular area
          // borderRadius: BorderRadius.circular(25),
          child: Container( // Actual widget that becomes visible
            color: color,
            child: Center( // Used to center text on button
              child: Text( // Text itself
                buttonText,
                style: TextStyle( // Style of the text (color, font, size, etc.)
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

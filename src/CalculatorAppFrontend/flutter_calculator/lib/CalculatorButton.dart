library FlutterCalculator;

import 'package:flutter/material.dart';

// creating Stateless Widget for buttons, as even though interacting with them changes things, the buttons themselves do not change
class CalculatorButton extends StatelessWidget {
  // declaring variables
  final color; //Color
  final textColor; //Color
  final String buttonText; //String
  final buttontapped; //Function
  //Constructor
  CalculatorButton({
      this.color,
      this.textColor,
      required this.buttonText,
      this.buttontapped
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Widget that can detect actions involving it (touch, drag, etc.)
      onTap: buttontapped, // Function that responds to specified action (a tap or click in this case)
      child: Padding( // Puts a gap between buttons
        padding: const EdgeInsets.all(0.2), // Specifies the gap size to be 0.2 (Unsure about the unit)
        child: ClipRRect( // Constraints its contents to a rectangular area
          child: Container( // Actual widget that becomes visible
            color: color, // Color of the button
            child: Center( // Used to center text on button
              child: Text( // Widget for the text
                buttonText, // Text itself
                style: TextStyle( // Style of the text (color, font, size, etc.)
                  color: textColor, // Color of the button
                  fontSize: 25, // Size of the font
                  fontWeight: FontWeight.bold, // Makes text bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

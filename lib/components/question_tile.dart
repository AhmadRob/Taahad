import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  // The text to be displayed inside the tile
  final String verse;

  // Constructor to initialize the required parameter
  const QuestionTile({
    super.key,
    required this.verse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        // Background color of the container
        color: Colors.teal.shade800,
        // Rounded corners for the container
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        // Center-align the text inside the container
        textAlign: TextAlign.center,
        verse,
        style: const TextStyle(
          color: Colors.white, // Text color
          fontSize: 18, // Font size
          height: 2.1, // Line height
          wordSpacing: 1.5, // Space between words
        ),
      ),
    );
  }
}

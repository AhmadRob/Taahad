import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  // The text to be displayed inside the tile
  final String verse;

  // Callback function to handle tap events
  final VoidCallback onTap;

  // Color for the border of the tile
  final Color borderColor;

  // Constructor to initialize required parameters
  const ChoiceTile({
    super.key,
    required this.verse,
    required this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Calls the onTap callback when the container is tapped
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          // Rounded corners for the container
          borderRadius: BorderRadius.circular(18),
          // Background color of the container
          color: Colors.teal.shade100,
          // Border color and width of the container
          border: Border.all(color: borderColor, width: 3),
        ),
        child: Text(
          // The text to be displayed
          verse,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 18,
            height: 2.1,
            wordSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double borderRadius;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor, // Optional background color
    this.borderColor, // Optional border color
    this.textColor = Colors.white,
    this.borderRadius = 20.0,
    this.width = double.infinity, // Default full-width button
    this.height = 50.0, // Default button height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??
              Theme.of(context).primaryColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor ??
                  Colors.transparent, // Border color, default transparent
              width: 2.0, // Border width
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

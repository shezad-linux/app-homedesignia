// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget
      child; // The widgets you want to display inside the bottom sheet.
  final double radius; // Top corner radius.
  final double
      maxHeight; // Maximum height for the bottom sheet (percentage of screen height).

  const CustomBottomSheet({
    Key? key,
    required this.child,
    this.radius = 20.0,
    this.maxHeight = 0.9, // Defaults to 90% of the screen height.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: maxHeight, // Use a fraction of the screen height.
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag indicator
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            // Scrollable child
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

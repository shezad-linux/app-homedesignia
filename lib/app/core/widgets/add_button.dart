import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double radius;
  const AddButton({
    required this.onPressed,
    required this.radius,
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: PhysicalModel(
        color: Colors.blueGrey,
        elevation: 5,
        shape: BoxShape.circle,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

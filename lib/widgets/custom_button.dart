import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String text;
  Function onPressed;

  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.lightBlueAccent,
        child: InkWell(
          onTap: () {
            widget.onPressed();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

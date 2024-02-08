import 'package:flutter/material.dart';
import 'package:my_calculator/const.dart';

class MyButton extends StatefulWidget {
  final String title;
  Color myColor;
  final VoidCallback onPress;

  MyButton({super.key, required this.title,
    this.myColor=greyCol,
    required this.onPress});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 15),
      child: InkWell(
        onTap: widget.onPress,
        child: Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
              color: widget.myColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text(widget.title, style: TextStyle(fontSize: 20, color: Colors.white),)),
        ),
      ),
    );
  }
}


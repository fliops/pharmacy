import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButon extends StatelessWidget {
  CustomButon({super.key, required this.text, this.onPressed, this.onTap});
  String text;
  VoidCallback? onPressed;
  VoidCallback? onTap; //MaterialButtonمش بتاخد

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 150,
          height: 85,
          decoration: ShapeDecoration(
            color: const Color(0xFF247ABF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
                 style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Akshar',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            ),
          ),
        ),
      ),
    );
  }
}

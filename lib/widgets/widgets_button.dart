import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onClick,
    this.isLoading = false,
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          disabledBackgroundColor: Color.fromARGB(155, 105, 240, 174),
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 9,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: isLoading ? null : onClick,
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        ) : Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
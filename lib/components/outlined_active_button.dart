import 'package:flutter/material.dart';

import '../constants.dart';

class OutlinedActiveButton extends StatelessWidget {
  const OutlinedActiveButton({
    Key? key,
    required this.text,
    required this.press,
    this.isActive = false,
    // this.icon,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final bool isActive;
  // final icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: isActive
          ? OutlinedButton.styleFrom(
              backgroundColor: primaryColor, primary: Colors.white)
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // icon,
          SizedBox(
            width: 8,
          ),
          Text(text),
        ],
      ),
    );
  }
}

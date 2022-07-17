import 'package:flutter/material.dart';
import 'package:shop/components/my_outlined_button.dart';
import 'package:shop/components/outlined_active_button.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sorry'),
      content: const Text('This service is not available at the current time!'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actions: [
        OutlinedActiveButton(
            isActive: true,
            text: 'Okay',
            press: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}

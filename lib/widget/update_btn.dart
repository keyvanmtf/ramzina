import 'package:codyad/theme/colors.dart';
import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback onUpdate;

  const UpdateButton({required this.onUpdate, Key? key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onUpdate,
      child: Text(
        "به روزرسانی",
        style: TextStyle(color: Colors.white),
      ),
      style:
          ElevatedButton.styleFrom(backgroundColor: appColors.priceCardColor),
    );
  }
}

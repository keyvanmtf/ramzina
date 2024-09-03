import 'package:codyad/theme/colors.dart';
import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback onUpdate;

  const UpdateButton({
    super.key,
    required this.onUpdate,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onUpdate,
      style:
          ElevatedButton.styleFrom(backgroundColor: appColors.priceCardColor),
      child: const Text(
        "به روزرسانی",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

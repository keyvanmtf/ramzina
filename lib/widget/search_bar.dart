import 'package:codyad/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
      decoration: InputDecoration(
        hintText: "جستجوی ارز",
        hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),

        fillColor: appColors.bgColor,
        filled: true, // Explicit color for testing
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}

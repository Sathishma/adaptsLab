import 'package:adept_labs/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller; // Make the controller required
  final String labelText;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller, // Require the controller
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text
        CustomText(
          text: widget.labelText,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 4.0),

        // Text field
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          ),
          onChanged: (value) {
            setState(() {
              isFieldEmpty = value.isEmpty;
            });
          },
        ),
      ],
    );
  }
}

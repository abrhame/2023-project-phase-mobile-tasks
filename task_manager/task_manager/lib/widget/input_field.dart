import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 199, 61, 36),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 73, 73),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 73, 73),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}

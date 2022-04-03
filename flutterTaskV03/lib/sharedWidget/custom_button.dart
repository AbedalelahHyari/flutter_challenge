import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        child: Text(text),
      ),
    );
  }
}

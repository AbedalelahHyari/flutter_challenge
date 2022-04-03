import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  final Function onPress;
  final String text;

  const TxtButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(text),
      ),
    );
  }
}

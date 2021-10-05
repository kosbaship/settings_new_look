import 'package:flutter/material.dart';

class OneLineText extends StatelessWidget {
  final String text;
  final TextStyle style;

  OneLineText(this.text, {this.style});

  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style,
      );
}

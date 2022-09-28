import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

import '../constants/style_constants.dart';

class TypeWriterAnimTitle extends StatelessWidget {
  const TypeWriterAnimTitle({
    Key? key,
    required this.animatedTitle,
    required this.alignment,
  }) : super(key: key);

  final String animatedTitle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return TypeWriterText(
      alignment: alignment,
      text: Text(
        animatedTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: kDefaultTextColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            wordSpacing: 2,
            fontFamily: 'SpecialElite'),
      ),
      duration: const Duration(milliseconds: 100),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/style_constants.dart';

class InfoParaText extends StatelessWidget {
  const InfoParaText({
    Key? key,
    required this.infoText,
  }) : super(key: key);

  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Text(
        infoText,
        style:
            kDescTextStyle, //TODO: Extract Description Text Box Widget and Apply animation by wrapping it in a Container.
      ),
    );
  }
}

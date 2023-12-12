import 'package:flutter/material.dart';

import '../configs/theme.dart';
class ThreeLineBanner extends StatelessWidget {
  const ThreeLineBanner({super.key, required this.firstLine, required this.secondLine, required this.thirdLine, required this.textColor});
final String firstLine;
final String secondLine;
final String thirdLine;
final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          firstLine,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        Text(
          secondLine,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: textColor),
        ),
        Text(
          thirdLine,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: kPrimaryColor),
        ),
      ],
    );
  }
}

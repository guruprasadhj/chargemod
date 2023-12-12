import 'package:flutter/material.dart';

class InlineTextButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const InlineTextButton({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
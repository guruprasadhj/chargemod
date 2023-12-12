import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.hintText,
        this.labelText='',
        this.validator,
        this.onSubmit,
        this.readOnly=false,
        this.maxLine=1,
        this.onTap,
        this.onSave,
        this.inputFormatters,
        this.controller,
        this.color,
        this.prefixIcon,
        this.suffixIcon,
        this.keyboardType,
        this.enabled,
        this.textCapitalization =TextCapitalization.none,
        this.textInputAction,
        this.maxWidthSuffixIconConstraints = 50,
        this.fontSize=15,  this.obscureText=false,});

  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final Function(String)? onSubmit;
  final Function(String?)? onSave;
  final bool? readOnly;
  final int maxLine;
  final Function()? onTap;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Color? color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final double maxWidthSuffixIconConstraints;
  final double fontSize;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5,),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: kOutlineColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(fontSize: 17),
              textAlignVertical: TextAlignVertical.center,
              validator: validator,
              enabled: enabled,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    const TextStyle(color: kLightGreyHintTextColor, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

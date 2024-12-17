import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomInputNoHide extends StatelessWidget {
  final String title;
  final String hintText;
  final EdgeInsets margin;
  final bool obscureText;
  final Function(String) onTextChanged;
  const CustomInputNoHide({
    super.key,
    required this.title,
    required this.hintText,
    this.margin = EdgeInsets.zero,
    this.obscureText = false,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: light),
          ),
          SizedBox(height: 6),
          TextFormField(
            onChanged: onTextChanged,
            obscureText: obscureText,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: greyTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

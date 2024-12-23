import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomInputHide extends StatefulWidget {
  final String title;
  final String hintText;
  final EdgeInsets margin;
  final Function(String) onTextChanged;

  const CustomInputHide({
    super.key,
    required this.title,
    required this.hintText,
    this.margin = const EdgeInsets.all(0),
    required this.onTextChanged,
  });

  @override
  State<CustomInputHide> createState() => _CustomInputHideState();
}

class _CustomInputHideState extends State<CustomInputHide> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            onChanged: widget.onTextChanged,
            obscureText: obscureText,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: greyTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

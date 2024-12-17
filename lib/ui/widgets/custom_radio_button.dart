import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? groupValue;
  final EdgeInsets margin;
  const CustomRadioButton({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    this.groupValue,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.groupValue;
  }

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
          Row(
            children: widget.options.map((option) {
              return Expanded(
                child: Row(
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: _selectedValue,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                        widget.onChanged(value);
                      },
                    ),
                    Text(
                      option,
                      style: blackTextStyle,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

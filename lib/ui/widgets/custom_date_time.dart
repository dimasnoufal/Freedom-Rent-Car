import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomDateTime extends StatefulWidget {
  final String title;
  final String hintText1;
  final String hintText2;
  final EdgeInsets margin;
  const CustomDateTime({
    super.key,
    required this.title,
    required this.hintText1,
    required this.hintText2,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  State<CustomDateTime> createState() => _CustomDateTimeState();
}

class _CustomDateTimeState extends State<CustomDateTime> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: kWhiteColor,
                onPrimary: kPrimaryColor,
                surface: kPrimaryColor,
                onSurface: kWhiteColor),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: kWhiteColor,
                onPrimary: kPrimaryColor,
                surface: kPrimaryColor,
                onSurface: kWhiteColor),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
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
            children: [
              Expanded(
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: widget.hintText1,
                    hintStyle: greyTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: widget.hintText2,
                    hintStyle: greyTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  readOnly: true,
                  onTap: () => _selectTime(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

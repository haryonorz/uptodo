import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/shared/common/common.dart';

class TextFormFieldLabel extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Color? fillColor;

  const TextFormFieldLabel({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 12.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.spanishGrey),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'app_text.dart';

class AppInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double height;
  final TextInputType inputType;
  final TextAlign textAlign;
  final bool isObscure;
  final IconButton suffixIcon;
  final String hint;
  final bool hasSuffix;
  final bool radius;
  final int maxLine;
  final int minLine;
  final bool readOnly;
  //final InputDecoration decoration;

  const AppInput(
      {Key? key,
      this.label = "",
      required this.hasSuffix,
      required this.controller,
      required this.validator,
      this.height = 55,
      this.inputType = TextInputType.text,
      this.isObscure = false,
      this.suffixIcon = const IconButton(
        icon: Icon(Icons.edit),
        onPressed: null,
      ),
      this.textAlign = TextAlign.start,
      this.hint = "",
      this.radius = true,
      this.maxLine = 1,
      this.minLine = 1,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(0.0),
          child: AppText(
            label,
            color: AppColors.getblueColor,
            size: 20.0,
            weight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: hasSuffix ? suffixIcon : null,
              hintStyle: TextStyle(color: AppColors.getGreyColor),
              prefixIconColor: AppColors.getblueColor,
              hintText: hint,
              focusColor: AppColors.getblueColor,
              iconColor: AppColors.getblueColor,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getblueColor)),
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getRedColor)),
              focusedBorder: radius
                  ? const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.getblueColor))
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // SEE HERE
                      borderSide: const BorderSide(
                          width: 3, color: AppColors.getblueColor),
                    ),
              focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getblueColor)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getblueColor)),
            ),
            obscureText: isObscure,
            keyboardType: inputType,
            controller: controller,
            maxLines: maxLine,
            validator: validator,
            textAlign: textAlign,
            style: const TextStyle(fontSize: 16, color: AppColors.getblueColor),
            minLines: 1,
          ),
        ),
      ],
    );
  }
}

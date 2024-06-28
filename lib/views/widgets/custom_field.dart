import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'utils.dart';

class BlumeField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool? enableCopy;
  final bool obscureText;
  final bool? autoFocus;
  final Color? color;
  final bool busy;
  final bool? noError;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;

  const BlumeField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.enabled,
    this.suffix,
    this.inputFormatters,
    this.busy = false,
    this.enableCopy,
    this.hintText,
    this.color,
    this.noError,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableCopy,
      cursorColor: AppColors.black.withOpacity(0.4),
      cursorWidth: 1.h,
      focusNode: focusNode,
      maxLines: maxLines,
      autofocus: autoFocus!,
      textCapitalization: TextCapitalization.words,
      enabled: enabled ?? true,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      style: GoogleFonts.inter(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.h),
        labelText: labelText,
        labelStyle: GoogleFonts.inter(
          color: const Color(0xffB2B1BA),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xffB2B1BA),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: color ?? Colors.white,
        errorStyle: GoogleFonts.inter(
          color: AppColors.red,
          fontSize: noError == true ? 0.1 : 10.sp,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 0.1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 0.1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
      ),
      obscureText: obscureText,
      onTap: onTap,
      onTapOutside: (a) {
        Utils.offKeyboard();
      },
      obscuringCharacter: '●',
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: textInputType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

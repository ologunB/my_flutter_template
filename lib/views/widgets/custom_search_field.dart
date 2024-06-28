import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class BlumeSearchField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
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
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;

  const BlumeSearchField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
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
    this.enableCopy,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      enableInteractiveSelection: enableCopy,
      cursorColor: AppColors.black.withOpacity(0.4),
      cursorWidth: 1.5.h,
      focusNode: focusNode,
      maxLines: maxLines,
      autofocus: autoFocus!,
      enabled: enabled ?? true,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      style: GoogleFonts.inter(
        color: AppColors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      placeholder: hintText,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      placeholderStyle: GoogleFonts.inter(
        color: const Color(0xff75757E),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      suffix: suffix,
      readOnly: readOnly,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8.h),
      ),
      obscureText: obscureText,
      onTap: onTap,
      obscuringCharacter: '●',
      controller: controller,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: textInputType,
      onChanged: onChanged,
    );
  }
}

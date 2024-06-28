import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'dart:convert';
export 'dart:io';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:provider/provider.dart';
export 'package:spur/views/widgets/utils.dart';

export 'base_view.dart';
export 'choose_file.dart';
export 'colors.dart';
export 'custom_button.dart';
export 'custom_field.dart';
export 'custom_progress.dart';
export 'custom_search_field.dart';
export 'flutter_masked_text.dart';
export 'snackbar.dart';

class BlumeText extends StatelessWidget {
  const BlumeText(
    this.text, {
    super.key,
    this.color,
    this.letterSpacing,
    this.height,
    this.align,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontWeight,
    this.blur = false,
    this.fontSize = 14,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final bool blur;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      style: GoogleFonts.inter(
        color: color,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}

class HardDataHolder {
  String id;
  String name;
  String desc;
  Widget? goto;
  List<String>? params;

  HardDataHolder(this.name, this.desc, this.id, {this.goto, this.params});
}

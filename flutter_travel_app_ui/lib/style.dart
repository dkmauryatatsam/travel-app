import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_travel_app_ui/colors.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({
    Key? key,
    this.color = AppColor.primaryColor,
    this.size = 16.0,
    this.fontWeight = FontWeight.w600,
    this.title = '',
  }) : super(key: key);

  final Color color;
  final double size;
  final FontWeight fontWeight;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}

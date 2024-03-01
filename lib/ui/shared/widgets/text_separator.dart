
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {

  final String text;

  const TextSeparator({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.white.withOpacity(0.3)
        ),
      ),
    );
  }
}
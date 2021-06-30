import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
Color kPrimaryColor = Color(0xff151515);
Color kSecondaryColor = Color(0xff301b3f);
Color kTertiaryColor = Color(0xff3c415c);
Color kQuartaryColor = Color(0xffb4a5a5);

//Font sizes

double bodyText1 = 14;
double title1 = 24;
double title3 = 20;

//App bar
AppBar appBar = AppBar(
  backgroundColor: kPrimaryColor,
  automaticallyImplyLeading: true,
  title: Align(
    alignment: Alignment(0, 0),
    child: Text(
      'Socail-TU',
      style: GoogleFonts.getFont(
        'Pacifico',
        color: Color(0xFFF4F4F4),
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  actions: [],
  centerTitle: true,
  elevation: 4,
);

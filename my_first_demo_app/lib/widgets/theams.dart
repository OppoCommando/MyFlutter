import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheam {
  static ThemeData lightTheam(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      cardColor: lightcardColor,
      hintColor: darkBulishColor,
      backgroundColor: Colors.white,
      buttonColor: darkBulishColor,
      canvasColor: Colors.white,
      accentColor: accentColor,
      primarySwatch: Colors.purple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheam(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        hintColor:Colors.white ,
        cardColor: darkcardColor,
        backgroundColor: Colors.black,
        buttonColor: lightBulishColor,
        accentColor: accentColor,
        canvasColor: darkcreamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6!.copyWith(color: Colors.white),
              ),
        ),
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBulishColor = Color(0xff403b58);
  static Color lightBulishColor = Vx.indigo500;
  static Color accentColor = Colors.black87;
  static Color lightcardColor = Colors.red.shade100;
  static Color darkcardColor = Colors.indigo.shade300;
}

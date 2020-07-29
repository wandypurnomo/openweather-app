import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openweather/presentation/home_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  double _radius = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: buildTextTheme(),
        colorScheme: buildColorScheme(),
        primaryColor: buildColorScheme().primary,
        accentColor: buildColorScheme().secondary,
        scaffoldBackgroundColor: buildColorScheme().surface,
        cardColor: buildColorScheme().secondary,
        cardTheme: CardTheme(
          color: buildColorScheme().primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(_radius),
            ),
          ),
        ),
        inputDecorationTheme: buildInputTheme(),
      ),
      home: HomeScreen(),
    );
  }

  TextTheme buildTextTheme() => TextTheme(
        headline1: GoogleFonts.exo(
          fontSize: 95,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.exo(
          fontSize: 59,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.exo(
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.exo(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.exo(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline6: GoogleFonts.exo(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.exo(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.exo(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.exo(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.exo(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );

  ColorScheme buildColorScheme() => ColorScheme(
        primary: Color(0xFF7A04EB),
        primaryVariant: Color(0xFF7A04EB),
        secondary: Color(0xFFFF00A0),
        secondaryVariant: Color(0xFFFF00A0),
        surface: Color(0xFFFE75FE),
        background: Color(0xFFFE75FE),
        error: Color(0xFFFF124F),
        onPrimary: Color(0xFFFE75FE),
        onSecondary: Color(0xFFFE75FE),
        onSurface: Color(0xFF120458),
        onBackground: Color(0xFF120458),
        onError: Color(0xFFFF124F),
        brightness: Brightness.light,
      );

  InputDecorationTheme buildInputTheme() => InputDecorationTheme(
        filled: true,
        fillColor: buildColorScheme().onSurface,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(color: buildColorScheme().surface),
        prefixStyle: TextStyle(color: buildColorScheme().primary),
        suffixStyle: TextStyle(color: buildColorScheme().primary),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(_radius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(_radius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(_radius),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: buildColorScheme().onError,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(_radius),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: buildColorScheme().onError,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(_radius),
          ),
        ),
      );
}

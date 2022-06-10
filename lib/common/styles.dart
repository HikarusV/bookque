import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF63B1F2);
const Color secondaryColor = Color(0xFFE7F2FF);

var appBarTitle = GoogleFonts.poppins(
  fontSize: 26,
  fontWeight: FontWeight.w600,
);
var titleLarge = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);
var titleMedium = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
var titleSmall = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
var descText = GoogleFonts.poppins(
  fontSize: 14,
  // fontWeight: FontWeight.w500,
);
var hintTitleLarge = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);
var hintTitle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.grey,
);
var subText = GoogleFonts.poppins(
  fontSize: 14,
);
var subTextGrey = GoogleFonts.poppins(
  fontSize: 14,
  color: Colors.grey,
);
var subTextWhite = GoogleFonts.poppins(
  fontSize: 14,
  color: Colors.white,
);
var subTextSmall = GoogleFonts.poppins(
  fontSize: 10,
);
var filterTitle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
var popUpTitle = GoogleFonts.poppins(
  fontSize: 22,
  color: Colors.white,
);
var buttonLarge = GoogleFonts.poppins(
  fontSize: 22,
  color: Colors.white,
);
var buttonMedium = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
var buttonMediumBlack = GoogleFonts.poppins(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);
var buttonSmall = GoogleFonts.poppins(
  fontSize: 12,
);
var titleButton = GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor);
var titleButtonSmall = GoogleFonts.poppins(
    fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00639A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFCDE5FF),
  onPrimaryContainer: Color(0xFF001D32),
  secondary: Color(0xFF795900),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDFA0),
  onSecondaryContainer: Color(0xFF261A00),
  tertiary: Color(0xFF863EA4),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFF8D8FF),
  onTertiaryContainer: Color(0xFF320046),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF6FEFF),
  onBackground: Color(0xFF001F24),
  surface: Color(0xFFF6FEFF),
  onSurface: Color(0xFF001F24),
  surfaceVariant: Color(0xFFDEE3EB),
  onSurfaceVariant: Color(0xFF42474E),
  outline: Color(0xFF72777F),
  onInverseSurface: Color(0xFFD0F8FF),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFF95CCFF),
  shadow: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF95CCFF),
  onPrimary: Color(0xFF003352),
  primaryContainer: Color(0xFF004A75),
  onPrimaryContainer: Color(0xFFCDE5FF),
  secondary: Color(0xFFFBBC00),
  onSecondary: Color(0xFF402D00),
  secondaryContainer: Color(0xFF5C4300),
  onSecondaryContainer: Color(0xFFFFDFA0),
  tertiary: Color(0xFFECB2FF),
  onTertiary: Color(0xFF520071),
  tertiaryContainer: Color(0xFF6C238A),
  onTertiaryContainer: Color(0xFFF8D8FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F24),
  onBackground: Color(0xFF97F0FF),
  surface: Color(0xFF001F24),
  onSurface: Color(0xFF97F0FF),
  surfaceVariant: Color(0xFF42474E),
  onSurfaceVariant: Color(0xFFC2C7CF),
  outline: Color(0xFF8C9198),
  onInverseSurface: Color(0xFF001F24),
  inverseSurface: Color(0xFF97F0FF),
  inversePrimary: Color(0xFF00639A),
  shadow: Color(0xFF000000),
);

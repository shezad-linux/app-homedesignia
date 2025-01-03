import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appLightTheme = ThemeData(
  // useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xffea585f),
  primaryColorLight: const Color(0xffffcccc),
  primaryColorDark: const Color(0xff990000),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xffffe5e5),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xffff0000),
  hintColor: const Color(0x8a000000),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(60.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xffea585f),
      secondary: Color(0xffff0000),
      surface: Color(0xffffffff),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xffff0000),
    textStyle: TextStyle(
        color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  )),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    isDense: false,
    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: null,
    inactiveTrackColor: null,
    disabledActiveTrackColor: null,
    disabledInactiveTrackColor: null,
    activeTickMarkColor: null,
    inactiveTickMarkColor: null,
    disabledActiveTickMarkColor: null,
    disabledInactiveTickMarkColor: null,
    thumbColor: null,
    disabledThumbColor: null,
    thumbShape: null,
    overlayColor: null,
    valueIndicatorColor: null,
    valueIndicatorShape: null,
    showValueIndicator: null,
    valueIndicatorTextStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xb2ffffff),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3deb0000),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(
        side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    )),
  ),
  dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
  bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xffffffff)),
  switchTheme: SwitchThemeData(
    thumbColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Color(0xffff9999);
      }
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffcc0000);
      }
      return Color(0xffff9999);
    }),
    trackColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey;
      }
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffff9999);
      }
      return null;
    }),
  ),

  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return const Color(0xffcc0000);
      }
      return null;
    }),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff4285f4),
    selectionColor: Color(0xffff9999),
    selectionHandleColor: Color(0xffff6666),
  ),
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(4293591040, {
    50: Color(0xffffe5e5),
    100: Color(0xffffcccc),
    200: Color(0xffff9999),
    300: Color(0xffff6666),
    400: Color(0xffff3333),
    500: Color(0xffff0000),
    600: Color(0xffcc0000),
    700: Color(0xff990000),
    800: Color(0xff660000),
    900: Color(0xff330000)
  }))
      .copyWith(surface: const Color(0xffff9999))
      .copyWith(error: const Color(0xffd32f2f))
      .copyWith(secondary: const Color(0xffff0000)),
);

const Color themeColor = Color(0xFFEC0000);
const Color shadeColor = Color(0xFFFEF1F2);
const Color textFieldColor = Color(0xFFFFF9E5);

TextStyle empNameText = GoogleFonts.manrope(
    fontWeight: FontWeight.w600, fontSize: 10.sp, color: Colors.black);

TextStyle headlineText = GoogleFonts.manrope(
    fontSize: 23.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF111111));

TextStyle headlineSmall = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF111111));

TextStyle backButtonText = GoogleFonts.nunitoSans(
    color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400);

TextStyle bodyGrey = GoogleFonts.manrope(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF50555C));

TextStyle bodyText = GoogleFonts.manrope(
    fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.black);

TextStyle titleText = GoogleFonts.manrope(
    fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black);

TextStyle buttonText = GoogleFonts.manrope(
    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp);

TextStyle docButtonText = GoogleFonts.manrope(
    fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.w600);

TextStyle saveButtonText = GoogleFonts.nunitoSans(
    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.sp);

TextStyle editButtonText = GoogleFonts.nunitoSans(
    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10.sp);

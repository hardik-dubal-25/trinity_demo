// ignore_for_file: constant_identifier_names

import '../../imports.dart'; 

class Themes {
  Themes._();

  static ColorScheme lightColorScheme =
      ColorScheme.fromSeed(seedColor: colorAppPrimary, background: colorAppWhite, surfaceTint: colorAppWhite);

  static ThemeData myTheme = ThemeData(
      useMaterial3: true,
       
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: colorAppWhite),
          backgroundColor: colorAppPrimary,
          surfaceTintColor: colorAppPrimary,
          systemOverlayStyle:
              SystemUiOverlayStyle(  statusBarColor: colorAppPrimary,statusBarBrightness: Brightness.dark)),
      scaffoldBackgroundColor: colorAppWhite,
      
      cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: colorAppWhite,
          surfaceTintColor: colorAppWhite),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        enabledBorder: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        focusedBorder: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        focusedErrorBorder: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        errorBorder: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        disabledBorder: OutlineInputBorder(borderSide: borderGrey, borderRadius: borderRadius18),
        //contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 20),
        //fillColor: Colors.grey.shade100
      ),
       elevatedButtonTheme: ElevatedButtonThemeData(
        
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(colorAppWhite),
            backgroundColor: WidgetStatePropertyAll(colorAppPrimary),
            textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16,color: colorAppWhite)),
            shape: WidgetStatePropertyAll(
            
            RoundedRectangleBorder(borderRadius: borderRadius13)))),
      dialogBackgroundColor: colorAppWhite,
      dialogTheme: DialogTheme(surfaceTintColor: colorAppWhite, backgroundColor: colorAppWhite));

  static ThemeData getTheme(BuildContext context) {
    return myTheme;
  }

  static const APP_FONT_SIZE_REGULAR = 16.0;
  static const APP_FONT_SIZE_10 = 10.0;
  static const APP_FONT_SIZE_EXTRA_LARGE = 20.0;

  static TextStyle getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: APP_FONT_SIZE_REGULAR,
        );
  }

  static TextStyle getTextStyleRegulerWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: APP_FONT_SIZE_REGULAR,
          color: colorAppWhite,
        );
  }

  static TextStyle getTextStyleBlue(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: APP_FONT_SIZE_REGULAR, color: myTheme.primaryColor);
  }

  static TextStyle getTextStyleSmall(BuildContext context) {
    return getTextStyle(context).copyWith(
      fontSize: APP_FONT_SIZE_10,
    );
  }

  static TextStyle getTextStyleSmallBlue(BuildContext context) {
    return getTextStyle(context).copyWith(fontSize: APP_FONT_SIZE_10, color: myTheme.primaryColor);
  }

  static TextStyle getTextStyleWhite(BuildContext context) {
    return getTextStyle(context).copyWith(color: colorAppWhite);
  }

  static TextStyle getTextStyleBoldWhite(BuildContext context) {
    return getTextStyleBold(context).copyWith(
      color: colorAppWhite,
    );
  }

  static TextStyle getTextStyleBold(BuildContext context) {
    return getTextStyle(context).copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle getTextStyleBoldBlue(BuildContext context) {
    return getTextStyle(context).copyWith(fontWeight: FontWeight.bold, color: myTheme.primaryColor);
  }
}

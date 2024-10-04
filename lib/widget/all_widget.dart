// ignore_for_file: deprecated_member_use

import '../imports.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget imageWidget(String image) {
  return Image.asset(image);
}

Widget text(String text, Color color, double fontsize, FontWeight fontWeight,
    {FontStyle fontStyle = FontStyle.normal, TextAlign textAlign = TextAlign.center}) {
  return Text(
    text,
    textAlign: textAlign,
    style:   TextStyle(
          color: color, fontSize: fontsize, fontStyle: fontStyle, fontWeight: fontWeight,  ),
     
  );
}

Widget textMore(String text, Color color, double fontsize, FontWeight fontWeight, int maxLines) {
  return Text(
    text,
    style:   TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
       
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

// confirmationDialog({
//   required String title,
//   required String message,
//   Function()? onNoPressed,
//   required Function onYesPressed,
//   double? dialogHeight,
//   double? dialogWidth,
// }) {
//   return Get.defaultDialog(
//     title: title,
//     titlePadding: appPaddingT20,
//     titleStyle: TextStyle(color: colorTextBlueGrey, fontSize: 20, fontWeight: fwt600),

//     content:
//         // Dialog(
//         //   child:
//         SizedBox(
//       // height: dialogHeight,
//       // width: dialogWidth,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             verticalSpace15,
//             SvgPicture.asset(iconQuestionMark, height: 80, width: 80),
//             verticalSpace15,
//             // text(title, colorTextBlueGrey, 20, fwt500),
//             // verticalSpace10,
//             Padding(
//               padding: const EdgeInsets.only(left: 15.0, right: 15),
//               child: text(message, colorAppBlack, 17, fwt300),
//             ),
//             verticalSpace15,
//             SizedBox(
//               height: 43,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   whiteButton(
//                       "NO",
//                       onNoPressed ??
//                           () {
//                             Get.back();
//                           },
//                       bWidth: 120),
//                   blueButton("YES", onYesPressed, color: colorTextBlueGrey, bWidth: 120),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     // )
//   );
// }

Widget greenButton(String text, Function fun, double bHeight, double bWidth) {
  return SizedBox(
    width: bWidth,
    height: bHeight,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: colorAppGreen),
      onPressed: () async {
        fun();
      },
      child:
          Center(child: Text(text, style: TextStyle(fontSize: 16, color: colorAppWhite, fontWeight: FontWeight.w500))),
    ),
  );
}

Widget redButton(String text, Function fun, double bHeight, double bWidth) {
  return SizedBox(
    width: bWidth,
    height: bHeight,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: colorAppRed),
      onPressed: () async {
        fun();
      },
      child:
          Center(child: Text(text, style: TextStyle(fontSize: 16, color: colorAppWhite, fontWeight: FontWeight.w500))),
    ),
  );
}

Widget whiteButton(String text, Function fun, {double? bHeight, double? bWidth}) {
  return SizedBox(
    width: bWidth ?? Get.width * 0.9,
    height: bHeight ?? 60,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: colorAppWhite,
          backgroundColor: colorAppWhite,
          elevation: 1,
          side: BorderSide(color: colorTextBlueGrey, width: 1.5)),
      onPressed: () async {
        fun();
      },
      child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 16, color: colorTextBlueGrey, fontWeight: FontWeight.w500))),
    ),
  );
}

Widget normalButton(String text, Function fun, {double? bHeight, double? bWidth}) {
  return SizedBox(
      width: bWidth ?? Get.width * 0.9,
      height: bHeight ?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: colorAppWhite, backgroundColor: colorAppPrimary),
        onPressed: () async {
          fun();
        },
        child: Text(text, style: TextStyle(fontSize: 16, color: colorAppWhite, fontWeight: FontWeight.w500)),
      ));
}

Widget blueButton(String text, Function fun,
    {double? bHeight, double? bWidth, Color? color, Color? textColor, double? fontSize}) {
  return SizedBox(
      width: bWidth ?? Get.width * 0.9,
      height: bHeight ?? 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: colorAppWhite, backgroundColor: color ?? colorAppBlue),
        onPressed: () async {
          fun();
        },
        child: Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: fontSize ?? 16, color: textColor ?? colorAppWhite, fontWeight: FontWeight.w500))),
      ));
}

Widget kPrimaryButton(String text, Function fun) {
  return GestureDetector(
    onTap: () async {
      fun();
      // controller.updateLocation();
    },
    child: Container(
      height: 45,
      width: Get.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [colorAppBlueAccent, colorAppBlueAccentShade400]),
      ),
      child: Center(
          child: Text(text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: colorAppWhite, fontFamily: 'futur'))),
    ),
  );
}

Widget backButton() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: colorBlackButtonBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.arrow_back_ios, size: 22),
    ),
  );
}

appBar(String texts, {bool? showBackIcon, bool? centerTitle, List<Widget>? actions, Color? color}) {
  return AppBar(
    backgroundColor: color ?? colorAppWhite,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colorScaffoldBackground,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark),
    centerTitle: centerTitle ?? true,
    leadingWidth: 60,
    // leading: Visibility(
    //   visible: showBackIcon ?? true,
    //   child: GestureDetector(
    //     onTap: () {
    //       Get.back();
    //     },
    //     child: Container(
    //       margin: const EdgeInsets.fromLTRB(10,8,10,8),
    //        alignment: Alignment.center,
    //       decoration: BoxDecoration(
    //           border: Border.all(color: const Color(0xffE9E1F4)), borderRadius: BorderRadius.circular(12)),
    //       child: const Center(child: Icon(Icons.arrow_back_ios_new, size: 22)),
    //     ),
    //   ),
    // ),
    automaticallyImplyLeading: showBackIcon ?? true,
    title: text(texts, colorAppBlack, 20, FontWeight.w700),
    actions: actions ?? [],
  );
}

// Widget buttonWithIcon(String title, void Function()? onPressed, {Color? color, Color? textColor}) {
//   return SizedBox(
//     height: 45,
//     width: Get.width / 2.3,
//     child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: color ?? colorAppPrimary),
//         onPressed: () {
//           //Get.toNamed(AppRoute.routeAttendanceArea, arguments: {'isFirstTime': false});
//         },
//         child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SvgPicture.asset(iconPlus, color: textColor ?? colorAppWhite),
//           horizontalSpace(7),
//           text(title, textColor ?? colorAppWhite, 14, fwt500),
//         ])),
//   );
// }

//Color(0xffE9E1F4)
Widget divider({Color? color, double? thickness}) {
  return Divider(
      color: color ?? const Color.fromRGBO(245, 241, 253, 1), thickness: thickness ?? 1, indent: 5, endIndent: 5);
}

Widget verticalDivider({double? startindent, double? endindent}) {
  return VerticalDivider(
    thickness: 0.6,
    width: 8,
    indent: startindent ?? 0,
    endIndent: endindent ?? 0,
    color: const Color(0xff979EC0),
  );
}

Widget datePickerTextField(final String hintText, TextEditingController? controller, BuildContext context) {
  return TextFormField(
    keyboardType: TextInputType.none,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colorAppGrey),
      suffixIcon: GestureDetector(
        onTap: () async {
          String? dt = await openCalender(context);
          controller!.text = dt!;
        },
        child: Icon(Icons.calendar_today, color: colorAppBlack),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colorAppWhite, width: 0)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: colorAppWhite), borderRadius: BorderRadius.circular(13.0)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: colorAppWhite), borderRadius: BorderRadius.circular(13.0)),
    ),
  );
}

openCalender(BuildContext context) async {
  String? date = "";
  DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3050),
      builder: (context, picker) {
        return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                  primary: Themes.getTheme(context).colorScheme.primary,
                  onPrimary: colorAppWhite,
                  surface: Themes.getTheme(context).colorScheme.surface,
                  onSurface: Themes.getTheme(context).colorScheme.onSurface),
              dialogBackgroundColor: Themes.getTheme(context).dialogBackgroundColor,
            ),
            child: picker!);
      });
  if (newSelectedDate != null) {
    date = DateFormat('yyyy-MM-dd').format(newSelectedDate);
  }

  return date;
}

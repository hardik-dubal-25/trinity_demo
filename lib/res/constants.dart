//import 'package:dropdown_search/dropdown_search.dart';
import '../imports.dart';
//-----------------------------------------
// font

int company = 0, staff = 1, branchManager = 2, attendanceManager = 3;

int casualLeave = 1, privilegedLeave = 2, sickLeave = 3, unPaidLeave = 4;
int punchIn = 1, punchOut = 2;
int halfDay = 1, fullDay = 2, absent = 3, dayOff = 4;
int present = 0, paidLeave = 1, leaveUnpaid = -1;

int statusPending = 0, statusApproved = 1, statusCancel = 2, statusReject = 3;

String strUnPaidLeave = "UNPAID";

String strPending = "PENDING", strApproved = "APPROVED", strCancel = "CANCEl", strReject = "REJECTED";

Map<int, String> attStatus = {
  fullDay: "PRESENT",
  halfDay: "HALF DAY",
  absent: "ABSENT",
  dayOff: "DAY OFF",
};

Map<int, String> userRole = {
  company: "OWNER",
  staff: "EMPLOYEE",
  branchManager: "BRANCH MANAGER",
  attendanceManager: "ATTENDANCE MANAGER"
};
double fs10 = 10,
    fs12 = 12,
    fs14 = 14,
    fs16 = 16,
    fs18 = 18,
    fs20 = 20,
    fs22 = 22,
    fs24 = 24,
    fs26 = 26,
    fs28 = 28,
    fs30 = 30;

FontWeight fwt100 = FontWeight.w100,
    fwt200 = FontWeight.w200,
    fwt300 = FontWeight.w300,
    fwt400 = FontWeight.w400,
    fwt500 = FontWeight.w500,
    fwt600 = FontWeight.w600,
    fwt700 = FontWeight.w700,
    fwt800 = FontWeight.w800;

//----------------------------------------------------------
// padding

EdgeInsets appPadding20 = const EdgeInsets.all(20),
    appPadding15 = const EdgeInsets.all(15),
    appPadding10 = const EdgeInsets.all(10),
    appPadding5 = const EdgeInsets.all(5),
    appPaddingLR7 = const EdgeInsets.fromLTRB(7, 0, 7, 0),
    appPaddingLR10 = const EdgeInsets.fromLTRB(10, 0, 10, 0),
    appPaddingLR20 = const EdgeInsets.fromLTRB(20, 0, 20, 0),
    appPaddingT10 = const EdgeInsets.only(top: 10),
    appPaddingB10 = const EdgeInsets.only(bottom: 10),
    appPaddingL10 = const EdgeInsets.only(left: 10),
    appPaddingR10 = const EdgeInsets.only(right: 10),
    appPaddingT20 = const EdgeInsets.only(top: 20),
    appPaddingB20 = const EdgeInsets.only(bottom: 20),
    appPaddingL20 = const EdgeInsets.only(left: 20),
    appPaddingR20 = const EdgeInsets.only(right: 20);
//-------------------------------------------------------
 // sized box

SizedBox verticalSpace5 = SizedBox(height: 5.dynamicHeight()),
    verticalSpace10 = SizedBox(height: 10.dynamicHeight()),
    verticalSpace12 = SizedBox(height: 12.dynamicHeight()),
    verticalSpace15 = SizedBox(height: 15.dynamicHeight()),
    verticalSpace20 = SizedBox(height: 20.dynamicHeight());

SizedBox horizontalSpace5 = SizedBox(width: 5.dynamicWidth()),
    horizontalSpace10 = SizedBox(width: 10.dynamicWidth()),
    horizontalSpace12 = SizedBox(width: 12.dynamicWidth()),
    horizontalSpace15 = SizedBox(width: 15.dynamicWidth()),
    horizontalSpace20 = SizedBox(width: 20.dynamicWidth());

SizedBox verticalSpace(double h) {
  return SizedBox(height: h.dynamicHeight());
}

SizedBox horizontalSpace(double h) {
  return SizedBox(width: h.dynamicWidth());
}
//-------------------------------------------------------
// border radius

BorderRadius borderRadius6 = BorderRadius.circular(6),
    borderRadius7 = BorderRadius.circular(7),
    borderRadius10 = BorderRadius.circular(10),
    borderRadius13 = BorderRadius.circular(13),
    borderRadius15 = BorderRadius.circular(15),
    borderRadius18 = BorderRadius.circular(18),
    borderRadius20 = BorderRadius.circular(20),
    borderRadius25 = BorderRadius.circular(25),
    borderRadius30 = BorderRadius.circular(30),
    borderRadius100 = BorderRadius.circular(100);

BorderRadius borderRadiusTopOnly15 =  const BorderRadius.only(
  topLeft: Radius.circular(15),
  topRight: Radius.circular(15)
);

BorderSide borderSideBlue = BorderSide(color: colorAppBlue);
BorderSide borderSideBlueGrey = BorderSide(color: colorTextBlueGrey);
BorderSide borderGrey = BorderSide(color: colorBorderGrey, width: 1.5);
BorderSide borderPrimary = BorderSide(color: colorAppPrimary, width: 1.5);



setStatusBarColor({Color? color}) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color ?? colorAppWhite, statusBarIconBrightness: Brightness.dark));
}

  // card shadow
final BoxShadow cardShadow = BoxShadow(
  color: colorCardShadow,
  blurRadius: 9,
  offset: const Offset(14, 14),
  spreadRadius: 1
);

// DropDownDecoratorProps dropDownDecoration = DropDownDecoratorProps(
//   baseStyle: const TextStyle(fontSize: 16),
//   dropdownSearchDecoration: InputDecoration(
//     errorBorder: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),

//     disabledBorder: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),
//     focusedErrorBorder: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),
//     focusedBorder: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),
//     enabledBorder: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),
//     border: OutlineInputBorder(borderRadius: borderRadius13, borderSide: borderSideBlue),
//     contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
//   ),
//);
//--------------------------------------------------

RoundedRectangleBorder cardShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomRight: Radius.circular(13)));

bool isDesktop = GetPlatform.isDesktop,
    isMobile = GetPlatform.isMobile,
    isAndroid = GetPlatform.isAndroid,
    isWeb = GetPlatform.isWeb,
    isWindows = GetPlatform.isWindows;

bool isMobileWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width <= 500;
}

bool isLargeMobile(BuildContext context) {
  return MediaQuery.sizeOf(context).width <= 700;
}

bool isTablet(BuildContext context) {
  return MediaQuery.sizeOf(context).width < 1080;
}

bool isDesktopWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width > 1024;
}

bool isExtraLargeScreen(BuildContext context) {
  return MediaQuery.sizeOf(context).width > 1400;
}

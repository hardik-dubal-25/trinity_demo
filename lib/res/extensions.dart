import '../imports.dart';

extension ScreenSizeResolutionDouble on double {
  dynamicHeight() {
    double originalHeight = 800;
    double currentHeight = Get.height;
    double givenHeight = this;
    double calculatedHeight = 0;
    calculatedHeight = ((currentHeight * givenHeight) / originalHeight);
    return calculatedHeight;
  }

  dynamicWidth() {
    double originalWidth = 375;
    double currentWidth = Get.height;
    double givenWidth = this;
    double calculatedWidth = 0;
    calculatedWidth = ((currentWidth * givenWidth) / originalWidth);
    return calculatedWidth;
  }
}

extension ScreenSizeResolutionInt on int {
  dynamicHeight() {
    double originalHeight = 800;
    double currentHeight = Get.height;
    int givenHeight = this;
    double calculatedHeight = 0;
    calculatedHeight = ((currentHeight * givenHeight) / originalHeight);
    return calculatedHeight;
  }

  dynamicWidth() {
    double originalWidth = 375;
    double currentWidth = Get.height;
    int givenWidth = this;
    double calculatedWidth = 0;
    calculatedWidth = ((currentWidth * givenWidth) / originalWidth);
    return calculatedWidth;
  }
}

extension ValiationExtensions on String {
  validateEmpty() {
    if (isEmpty) {
      return 'Please enter the value';
    } else {
      return null;
    }
  }

  validateEmail() {
    var regExp = RegExp(emailPattern);
    if (isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String v, String password) {
    if (v.isEmpty || password.isEmpty) {
      return 'Repeat password is required';
    } else if (v.length < 6 || password.length < 6 || v != password) {
      return 'Password do not match';
    } else {
      return null;
    }
  }

  validatePassword() {
    if (isEmpty) {
      return 'Password is required';
    } else if (length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  validateMobile() {
    var regExp = RegExp(mobilePattern);
    if (replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    } else if (replaceAll(" ", "").length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }

  String? birthdayValidation() {
    if (isEmpty) {
      return 'Please enter Date';
    }
    return null;
  }

  String? addressValidation() {
    if (isEmpty) {
      return 'Please enter Address';
    }
    return null;
  }

  String? eductionValidation() {
    if (isEmpty) {
      return 'Please enter eduction';
    }
    return null;
  }

  String? instaValidation() {
    if (isEmpty) {
      return 'Please enter Instagram';
    }
    return null;
  }

  String? faceboookValidation() {
    if (isEmpty) {
      return 'Please enter Facebook';
    }
    return null;
  }

  String? nameValidation() {
    if (isEmpty) {
      return 'Please enter your Name';
    }
    return null;
  }

  String? lastNameValidation() {
    if (isEmpty) {
      return 'Please enter Last Name';
    }
    return null;
  }

  String? validatePinCode() {
    if (isEmpty) {
      return 'Pin code is required';
    } else if (length < 6) {
      return 'Pin code must be 6 characters';
    }
    return null;
  }

  String? emergencyName1Validation() {
    if (isEmpty) {
      return 'Please enter  Name';
    }
    return null;
  }

  String? emergencyNumber1Validation() {
    if (isEmpty) {
      return 'Please enter  Number';
    }
    return null;
  }
}

extension WidgetExtensions on Widget {
  circleProgressIndicator() =>
      Container(alignment: FractionalOffset.center, child: const CircularProgressIndicator(strokeWidth: 1));

  myText(
          {required String title,
          Color textColor = Colors.white,
          FontWeight fontWeight = FontWeight.normal,
          double titleSize = 18}) =>
      Text(
        title,
        style: TextStyle(color: textColor, fontSize: titleSize, fontWeight: fontWeight),
      );
}

inputField({
  ValueChanged<String>? onChanged,
  TextEditingController? controller,
  double? height,
  double? width,
  int? maxLength,
  TextInputType? keyboardType,
  String? hintText,
  String? labelText,
  int maxLines = 1,
  bool obscureText = false,
  InkWell? inkWell,
  FormFieldValidator<String>? validation,
  bool? editable,
  bool readonly = false,
}) =>
    TextFormField(
      readOnly: readonly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      // style: TextStyle(color: loginBox),
      maxLines: maxLines,
      onChanged: onChanged,
      enabled: editable,
      decoration: InputDecoration(
        counterText: "",
    
        border: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        hintStyle:   TextStyle(color: colorTextBlueGrey, fontFamily: "futur"),
        filled: true,
    
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorTextBlueGrey)),
        fillColor: colorAppWhite,
        hintText: hintText,
        suffixIcon: Padding(padding: const EdgeInsets.all(7.0), child: inkWell),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.all(7.0),
        //   child: inkWell,
        // ),
        // prefixIconColor: Colors.grey
      ),
      validator: validation,
    );

inputField2({
  ValueChanged<String>? onChanged,
  TextEditingController? controller,
  double? height,
  double? width,
  int? maxLength,
  TextInputType? keyBoardType,
  String? hintText,
  String? labelText,
  int maxLines = 1,
  bool obscureText = false,
  Widget? suffix,
  FormFieldValidator<String>? validation,
  bool? editable,
  void Function()? ontap,
  bool readonly = false,
  Widget? prefix,
  Icon? icon,
}) =>
    TextFormField(
      readOnly: readonly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyBoardType,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      // style: TextStyle(color: loginBox),
      maxLines: maxLines,
      onChanged: onChanged,
      enabled: editable,
      onTap: ontap,
      decoration: InputDecoration(
        counterText: "",
        //border: InputBorder.none,
        hintStyle: TextStyle(color: colorTextGreyDark, fontWeight: fwt400),
        labelStyle: TextStyle(color: colorTextGreyDark, fontWeight: fwt500),
        //filled: true,
        // focusedBorder: OutlineInputBorder(borderRadius: borderRadius15),
        // focusedErrorBorder: OutlineInputBorder(borderRadius: borderRadius15),
        // disabledBorder: OutlineInputBorder(borderRadius: borderRadius15),
        // enabledBorder: OutlineInputBorder(borderRadius: borderRadius15),
        // errorBorder: OutlineInputBorder(borderRadius: borderRadius15),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: Padding(padding: const EdgeInsets.all(6.0), child: suffix),
        prefixIcon: prefix,
        contentPadding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
      ),
      validator: validation,
    );

inputField3(
        {ValueChanged<String>? onChanged,
        TextEditingController? controller,
        double? height,
        double? width,
        int? maxLength,
        TextInputType? keyboardType,
        String? hintText,
        String? labelText,
        int maxLines = 1,
        bool obscureText = false,
        Widget? inkWell,
        FormFieldValidator<String>? validation,
        bool? editable,
        bool readonly = false,
        void Function()? ontap}) =>
    TextFormField(
      readOnly: readonly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      onTap: ontap,
      onChanged: onChanged,
      enabled: editable,
      decoration: InputDecoration(
          counterText: "",
          hintStyle: TextStyle(color: colorTextGreyDark, fontWeight: fwt400),
          hintText: hintText,
          suffixIcon: Padding(padding: const EdgeInsets.all(7.0), child: inkWell),
          contentPadding: const EdgeInsets.all(16)
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.all(7.0),
          //   child: inkWell,
          // ),
          // prefixIconColor: Colors.grey
          ),
      validator: validation,
    );
inputField4(
        {ValueChanged<String>? onChanged,
        TextEditingController? controller,
        double? height,
        double? width,
        int? maxLength,
        TextInputType? keyboardType,
        String? hintText,
        String? labelText,
        int maxLines = 1,
        bool obscureText = false,
        Widget? prefix,
        FormFieldValidator<String>? validation,
        bool? editable,
        bool readonly = false,
        void Function()? ontap}) =>
    TextFormField(
      readOnly: readonly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      // style: TextStyle(color: loginBox),
      maxLines: maxLines,
      onTap: ontap,
      onChanged: onChanged,
      enabled: editable,
      decoration: InputDecoration(
        counterText: "",
        //border: InputBorder.none,
        hintStyle: TextStyle(color: colorTextGreyDark, fontWeight: fwt400),
        //filled: true,
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade500),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade500),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade500),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade500),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey.shade500),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        // fillColor: Colors.white,
        hintText: hintText,
        // suffix: Padding(
        //   padding: const EdgeInsets.all(0.0),
        //   child: inkWell,
        // ),
        prefixIcon: Padding(padding: const EdgeInsets.all(7.0), child: prefix),
        contentPadding: const EdgeInsets.fromLTRB(17, 17, 17, 17),
      ),
      validator: validation,
    );

inputField5(
        {ValueChanged<String>? onChanged,
        TextEditingController? controller,
        double? height,
        double? width,
        bool? showPassword,
        int? maxLength,
        TextInputType? keyboardType,
        String? hintText,
        String? labelText,
        int maxLines = 1,
        bool obscureText = false,
        Widget? prefix,
        FormFieldValidator<String>? validation,
        bool? editable,
        bool readonly = false,
        Widget? suffix}) =>
    Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 2),
      child: TextFormField(
        readOnly: readonly,
        controller: controller,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        maxLength: maxLength,
        // style: TextStyle(color: loginBox),
        maxLines: maxLines,
        onChanged: onChanged,
        enabled: editable,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintStyle: TextStyle(color: colorAppPrimary,fontSize: 16),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          focusedBorder: OutlineInputBorder(borderSide: borderSideBlue, borderRadius: borderRadius18),
          focusedErrorBorder: OutlineInputBorder(borderSide: borderPrimary, borderRadius: borderRadius18),
          disabledBorder: OutlineInputBorder(borderSide: borderPrimary, borderRadius: borderRadius18),
          enabledBorder: OutlineInputBorder(borderSide: borderPrimary, borderRadius: borderRadius18),
          errorBorder: OutlineInputBorder(borderSide: borderPrimary, borderRadius: borderRadius18),
          fillColor: colorAppWhite,
          hintText: hintText,
        ),
        validator: validation,
      ),
    );
  inputFieldNoBorder({
  ValueChanged<String>? onChanged,
  TextEditingController? controller,
   void Function()? ontap,
  int? maxLength,
  TextInputType? keyboardType,
  String? hintText,
  String? labelText,
  int maxLines = 1,
  bool obscureText = false,
  InkWell? inkWell,
  FormFieldValidator<String>? validation,
  bool? editable,
  bool readonly = false,
}) =>
    TextFormField(
      
      readOnly: readonly,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
       onTap: ontap,
      maxLength: maxLength,
      // style: TextStyle(color: loginBox),
      maxLines: maxLines,
      onChanged: onChanged,
      enabled: editable,
      decoration: InputDecoration(
        counterText: "",
    
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        hintStyle:   TextStyle(color: colorTextBlueGrey, fontFamily: "futur"),
        filled: true,
    
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        disabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
        fillColor: colorAppWhite,
        hintText: hintText,
        suffixIcon: inkWell,
        contentPadding: const EdgeInsets.fromLTRB(12, 3,12,2)
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.all(7.0),
        //   child: inkWell,
        // ),
        // prefixIconColor: Colors.grey
      ),
      validator: validation,
    );

var emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
var mobilePattern = r'(^[0-9]*$)';

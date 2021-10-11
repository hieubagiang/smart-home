//
// import 'package:smart_home/app/common/utils/strings.dart';
//
// class Validate {
//   static String? _validatePhone = r'0\d{8,}';
//   static RegExp _expPhoneNumber = RegExp(_validatePhone!);
//
//   static String? validateFullName(String? value) {
//     if (value == null || value.isEmpty) {
//       return StringUtils.errorInvalidFullName;
//     }
//     return null;
//   }
//
//   static String? validatePhoneNumber(String? value) {
//     if (value == null ||
//         value.isEmpty ||
//         !_expPhoneNumber.hasMatch(value) ||
//         value.length > 10) {
//       return StringConstants.errorInvalidPhoneNumber;
//     }
//     return null;
//   }
//
//   static String? validatePassword(String? value) {
//     if (value.isEmpty || value.length < 6) {
//       return StringConstants.errorInvalidPassword;
//     }
//     return null;
//   }
//
//   static String? validateNewPassword(String? oldPassword, String? newPassword) {
//     if (oldPassword!.isEmpty) {
//       return null;
//     }
//     if (newPassword!.isEmpty || newPassword.length < 6) {
//       return StringConstants.errorInvalidPassword;
//     }
//     if (oldPassword == newPassword) {
//       return StringConstants.duplicatePassword;
//     }
//     return null;
//   }
//
//   static String? validateConfirmPassword(
//       String? oldPassword, String? newPassword, String? confirmPassword) {
//     if (oldPassword.isEmpty) {
//       return null;
//     }
//     if (newPassword != confirmPassword) {
//       return StringConstants.confirmPasswordInvalid;
//     }
//     return null;
//   }
//
//   static bool validateUrl(String? url) {
//     return Uri.parse(url!).isAbsolute;
//   }
//
//
//   static String? validateDate(String? value) {
//     if (value == null || value.isEmpty) {
//       return StringConstants.enterDate;
//     }
//     return null;
//   }
//
// }

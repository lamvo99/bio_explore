// Dart imports:

// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';

// Package imports:

// Project imports:
import '/shared_customization/data/regular_expressions.dart';
import '/shared_customization/extensions/string_ext.dart';

class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value.isEmptyOrNull) {
      return i18n.CommonValidation.Required(fieldName: i18n.CommonData.Email);
    } else if (EMAIL_REG_EXP.hasMatch(value!) == false) {
      return i18n.CommonValidation.InvalidEmailFormat;
    }
    return null;
  }

  // static String? validatePassword(String? value,
  //     {bool isNew = false, String? validateNewPwdNotSameOldPwd}) {
  //   if (value == null || value.trim().isEmpty) {
  //     return i18n.CommonValidation.Required(fieldName: i18n.CommonData.Password);
  //   }
  //   if (value.length < PASSWORD_MIN_LENGTH) {
  //     return tr(LocaleKeys.CommonValidation_MinLength, namedArgs: {
  //       "fieldName": isNew
  //           ? tr(LocaleKeys.ChangePassword_NewPassword)
  //           : tr(LocaleKeys.CommonData_Password),
  //       "value": PASSWORD_MIN_LENGTH.toString()
  //     });
  //   }
  //   if (value.length > PASSWORD_MAX_LENGTH) {
  //     return tr(LocaleKeys.CommonValidation_MaxLength, namedArgs: {
  //       "fieldName": isNew
  //           ? tr(LocaleKeys.ChangePassword_NewPassword)
  //           : tr(LocaleKeys.CommonData_Password),
  //       "value": PASSWORD_MAX_LENGTH.toString()
  //     });
  //   }
  //   if (!value.contains(PASSWORD_REG_EXP)) {
  //     return tr(LocaleKeys.CommonValidation_InvalidPasswordFormat);
  //   }
  //   if (isNew) return validateNewPwdNotSameOldPwd;
  //   return null;
  // }
  //
  // static String? validateNewPwdNotSameOldPwd(String? olPwd, String? newPwd) {
  //   if (olPwd.isNotEmptyOrNull && newPwd.isNotEmptyOrNull && olPwd == newPwd) {
  //     return tr(LocaleKeys.CommonValidation_NewPasswordCanNotSameOldPassword);
  //   }
  //   return null;
  // }
  //
  // static String? validateConfirmPassword(String? pwd, String? confirmPwd,
  //     {bool isNewConfirmPwd = false}) {
  //   if (confirmPwd == null || confirmPwd.trim().isEmpty) {
  //     return tr(LocaleKeys.CommonValidation_Required, namedArgs: {
  //       "fieldName": isNewConfirmPwd
  //           ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
  //           : tr(LocaleKeys.Register_ConfirmPassword)
  //     });
  //   }
  //   if (confirmPwd.length < PASSWORD_MIN_LENGTH) {
  //     return tr(LocaleKeys.CommonValidation_MinLength, namedArgs: {
  //       "fieldName": isNewConfirmPwd
  //           ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
  //           : tr(LocaleKeys.Register_ConfirmPassword),
  //       "value": PASSWORD_MIN_LENGTH.toString()
  //     });
  //   }
  //   if (confirmPwd.length > PASSWORD_MAX_LENGTH) {
  //     return tr(LocaleKeys.CommonValidation_MaxLength, namedArgs: {
  //       "fieldName": isNewConfirmPwd
  //           ? tr(LocaleKeys.ChangePassword_NewConfirmPassword)
  //           : tr(LocaleKeys.Register_ConfirmPassword),
  //       "value": PASSWORD_MAX_LENGTH.toString()
  //     });
  //   }
  //   if (!confirmPwd.contains(RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])'))) {
  //     return tr(LocaleKeys.CommonValidation_InvalidPasswordFormat);
  //   }
  //   if (pwd != confirmPwd) {
  //     return isNewConfirmPwd
  //         ? tr(LocaleKeys.CommonValidation_NewPasswordConfirmationNotMatch)
  //         : tr(LocaleKeys.CommonValidation_PasswordConfirmationNotMatch);
  //   }
  //   return null;
  // }
  //
  // static String? validateNotEmptyListOrString<T>(T? value,
  //     {String? errorCode, String? fieldName}) {
  //   bool isEmptyOrNull = [
  //     value is String && value.isEmptyOrNull,
  //     value is List && value.isEmpty,
  //     value == null
  //   ].any((element) => element);
  //   return isEmptyOrNull
  //       ? errorCode ??
  //           (fieldName.isNotEmptyOrNull
  //               ? tr(LocaleKeys.CommonValidation_Required,
  //                   namedArgs: {"fieldName": fieldName!})
  //               : tr(LocaleKeys.CommonValidation_CommonRequired))
  //       : null;
  // }
  //
  // static String? validateCodeVoucher(String? value) {
  //   bool isEmptyOrNull =
  //       [value.isEmptyOrNull, value == null].any((element) => element);
  //   if (isEmptyOrNull) {
  //     return tr(LocaleKeys.CommonValidation_Required,
  //             namedArgs: {"fieldName": tr(LocaleKeys.Voucher_Code)});
  //   }
  //   if (!isEmptyOrNull && value!.length < 8) {
  //     return tr(LocaleKeys.Voucher_ValidLength);
  //   }
  //   if (!isEmptyOrNull && !RegExp(r'^[A-Za-z]+$').hasMatch(value!)) {
  //     return tr(LocaleKeys.Voucher_CodeVoucherError);
  //   }
  //   return null;
  // }
  //
  // static String? validateCodeBranch(String? value) {
  //   bool isEmptyOrNull =
  //   [value.isEmptyOrNull, value == null].any((element) => element);
  //   if (isEmptyOrNull) {
  //     return  tr(LocaleKeys.CommonValidation_Required,
  //         namedArgs: {"fieldName": tr(LocaleKeys.Branch_BranchCode)});
  //   }
  //   if (!isEmptyOrNull && value!.length < 8) {
  //     return tr(LocaleKeys.Voucher_ValidLength);
  //   }
  //   if (!isEmptyOrNull && !RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value!)) {
  //     return tr(LocaleKeys.Branch_CodeError);
  //   }
  //   return null;
  // }
  //
  // static String? validateCodeDeleteAccount(String? value, {String? fieldName}) {
  //   bool isEmptyOrNull =
  //       [value.isEmptyOrNull, value == null].any((element) => element);
  //   if (isEmptyOrNull) {
  //     return (fieldName.isNotEmptyOrNull
  //         ? tr(LocaleKeys.CommonValidation_Required,
  //             namedArgs: {"fieldName": fieldName!})
  //         : tr(LocaleKeys.CommonValidation_CommonRequired));
  //   } else if (value!.length != 6 || double.tryParse(value) == null) {
  //     return tr(LocaleKeys.Voucher_ValidCode);
  //   }
  //   return null;
  // }
  //
  // static String? validatePriceDiscount(String? value, double? total,
  //     {String? fieldName}) {
  //   if (value.isNotEmptyOrNull && total != null) {
  //     if ((double.tryParse(value!) ?? total) > total) {
  //       return "$fieldName ${tr(LocaleKeys.Voucher_ValidPrice)}";
  //     }
  //   }
  //   return null;
  // }
  //
  // static String? validateDiscount(String? value, {String? title}) {
  //   bool isEmptyOrNull =
  //       [value is String && value.isEmptyOrNull].any((element) => element);
  //   if (isEmptyOrNull) return null;
  //   if (int.parse(value ?? "0") > 100) {
  //     return title ?? tr(LocaleKeys.Service_DiscountError);
  //   }
  //   return null;
  // }
  //
  // static String? validateFileNotNull(File? value,
  //     {String? errorCode, String? fieldName}) {
  //   return value == null
  //       ? errorCode ??
  //           (fieldName.isNotEmptyOrNull
  //               ? tr(LocaleKeys.CommonValidation_Required,
  //                   namedArgs: {"fieldName": fieldName!})
  //               : tr(LocaleKeys.CommonValidation_CommonRequired))
  //       : null;
  // }
  //
  // static String? validateUrl(String? value, {String? errorCode}) {
  //   if (value.isEmptyOrNull) {
  //     return tr(LocaleKeys.CommonValidation_CommonRequired);
  //   } else {
  //     return !value.isNotEmptyOrNull ||
  //             (value.isNotEmptyOrNull &&
  //                 LINK_REG_EXP.stringMatch(value!) == value)
  //         ? null
  //         : tr(LocaleKeys.User_ErorrUrl);
  //   }
  // }
  //
  // static String? validateListUrl(String? value, {String? errorCode}) {
  //   if (!value.isNotEmptyOrNull) {
  //     return tr(LocaleKeys.CommonValidation_CommonRequired);
  //   } else if (value.isNotEmptyOrNull && !value!.contains(",")) {
  //     return (LINK_REG_EXP.stringMatch(value) == value)
  //         ? null
  //         : tr(LocaleKeys.User_ErorrUrl);
  //   } else {
  //     List<String> stringList = value!.split(",");
  //     bool isValidator = true;
  //     for (var url in stringList) {
  //       isValidator =
  //           url.isNotEmptyOrNull && LINK_REG_EXP.stringMatch(url) == url;
  //     }
  //     return isValidator ? null : tr(LocaleKeys.User_ErorrUrl);
  //   }
  // }
  //
  // static String? validateDateTimeFormat(String? text, {Locale? locale}) {
  //   try {
  //     AppLanguage appLanguage = AppLanguage.values.firstWhere(
  //         (element) =>
  //             element.languageCode ==
  //             (locale?.languageCode ??
  //                 GlobalKeyVariable
  //                     .navigatorState.currentContext?.currentLanguageCode ??
  //                 'vi'),
  //         orElse: () => AppLanguage.vi);
  //     if (text.isNotEmptyOrNull &&
  //         DATE_TIME_REG_EXP.hasMatch(text!) &&
  //         appLanguage.getMyDateTime(text).isValidDate) {
  //       return null;
  //     }
  //     return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
  //   } catch (err) {
  //     return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
  //   }
  // }
  //
  // static String? validateDateAndTimeFormat(String? text, {Locale? locale}) {
  //   try {
  //     AppLanguage appLanguage = AppLanguage.values.firstWhere(
  //         (element) =>
  //             element.languageCode ==
  //             (locale?.languageCode ??
  //                 GlobalKeyVariable
  //                     .navigatorState.currentContext?.currentLanguageCode ??
  //                 'vi'),
  //         orElse: () => AppLanguage.vi);
  //     if (text.isNotEmptyOrNull &&
  //         DATE_AND_TIME_REG_EXP.hasMatch(text!) &&
  //         appLanguage.getMyDateAndTime(text).isValidDateAndTime) {
  //       return null;
  //     }
  //     return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
  //   } catch (err) {
  //     return tr(LocaleKeys.CommonValidation_DateTimeFormatIsInvalid);
  //   }
  // }
}

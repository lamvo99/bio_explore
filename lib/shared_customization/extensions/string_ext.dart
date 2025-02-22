// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// Package imports:

// Project imports:

extension StringExt on String? {
  ///
  /// Check empty or null
  ///
  bool get isEmptyOrNull => this == null || (this!.trim()).isEmpty;

  bool get isNotEmptyOrNull => this != null && (this!.trim()).isNotEmpty;

  int get strLength => (this ?? "").length;

  String get replaceCommas => (this ?? "0").replaceAll(",", "");

  String get replaceAddress =>
      (this ?? "")
          .replaceAll("THÀNH PHỐ", "")
          .replaceAll("TỈNH", "")
          .replaceAll("QUẬN", "")
          .replaceAll("HUYỆN", "")
          .replaceAll("THỊ XÃ", "")
          .replaceAll("PHƯỜNG", "")
          .replaceAll("XÃ", "")
          .replaceAll("1", "I")
          .replaceAll("2", "I")
          .replaceAll("3", "I")
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim()
          .trim();

  String removeDiacritics() {
    if (this == null) return "";
    String value = this!;
    const withDiacritics =
        'áàảãạâấầẩẫậăắằẳẵặéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđ'
        'ÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴĐ';
    const withoutDiacritics =
        'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd'
        'AAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYD';

    for (int i = 0; i < withDiacritics.length; i++) {
      value = value.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }

    return value;
  }

  String hiddenPhone() {
    if (isEmptyOrNull || this!.length < 9) return this ?? "";

    return this!.replaceRange((this!.length - 3), (this!.length), "***");
  }

  ///
  /// Check file extension
  ///
  String get urlFileName =>
      (this ?? '')
          .split('/')
          .last;

  String get fileExtension =>
      (this ?? '')
          .split('.')
          .last;

  String get _extractFileName {
    if (this == null) return '';
    final uri = Uri.tryParse(this!);
    return uri?.pathSegments.isNotEmpty == true ? uri!.pathSegments.last : '';
  }

  bool get isImage =>
      IMAGE_FILE_EXTENSION
          .any((element) => _extractFileName.toLowerCase().endsWith(element));

  bool get isVideo =>
      VIDEO_FILE_EXTENSIONS
          .any((element) => _extractFileName.toLowerCase().endsWith(element));

  bool get isPdf => urlFileName.toLowerCase().endsWith('.pdf');

  String checkHttps() {
    if (isEmptyOrNull) return "";
    String url = this!;
    bool isHttps = RegExp(r'^https?://').hasMatch(url);

    if (!isHttps) {
      url = 'https://$url';
    }

    return url;
  }

  bool isImageFromMimeType() {
    String extension = this!.split("/")[1];
    if (this!.startsWith('image')) {
      return true;
    }

    if (extension == '. jpg' ||
        extension == '.jpeg' ||
        extension == '.png' ||
        extension == '.gif' ||
        extension == '.bmp') {
      return true;
    }

    return false;
  }

  ///
  /// Conver to datetime
  ///
  DateTime? toDateTime({Locale? locale}) {
    if (isEmptyOrNull
        // || Validators
        //     .validateDateTimeFormat(this, locale: locale)
        //     .isNotEmptyOrNull
    ) {
      return null;
    }
    String dateformat = 'dd/MM/yyyy';
    switch ('vi') {
      case 'zh':
        dateformat = 'yyyy/MM/dd';
        break;
      case 'ja':
        dateformat = 'yyyy/MM/dd';
        break;
      case 'vi':
        dateformat = 'dd/MM/yyyy';
        break;
      case 'en':
        dateformat = 'MM/dd/yyyy';
        break;
      default:
        dateformat = 'dd/MM/yyyy';
    }
    try {
      return DateFormat(dateformat).parse(this!);
    } catch (err) {
      return null;
    }
  }

  DateTime? toDateTimeNow() {
    String dateformat = 'yyyy-MM-dd';
    try {
      return DateFormat(dateformat).parse(this!);
    } catch (err) {
      return null;
    }
  }

  DateTime? toDateAndTime({Locale? locale}) {
    if (isEmptyOrNull
        // || Validators
        //     .validateDateAndTimeFormat(this, locale: locale)
        //     .isNotEmptyOrNull
    ) {
      return null;
    }
    String dateformat = 'dd/MM/yyyy HH:mm';
    switch (
        'vi') {
      case 'zh':
        dateformat = 'yyyy/MM/dd HH:mm';
        break;
      case 'ja':
        dateformat = 'yyyy/MM/dd HH:mm';
        break;
      case 'vi':
        dateformat = 'dd/MM/yyyy HH:mm';
        break;
      case 'en':
        dateformat = 'MM/dd/yyyy HH:mm';
        break;
      default:
        dateformat = 'dd/MM/yyyy HH:mm';
    }
    try {
      return DateFormat(dateformat).parse(this!);
    } catch (err) {
      return null;
    }
  }

  ///
  ///
  ///
  String get hardCoded => this ?? "";

  String addCommasToNumber() {
    if (isEmptyOrNull) {
      return '';
    }

    List<String> parts = this!.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    integerPart = integerPart.replaceAllMapped(regex, (match) {
      return '${match.group(1)},';
    });

    return integerPart + decimalPart;
  }
}

class NoDecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue,) {
    String sanitizedText;
    int selectionIndexFromTheRight;

    RegExp regexNum = RegExp(r'^[0-9]+$');
    sanitizedText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (oldValue.text.isEmpty && !regexNum.hasMatch(newValue.text)) {
      return oldValue;
    } else if (newValue.text.startsWith("0") &&
        sanitizedText.length > 1 &&
        double.parse(sanitizedText) != 0) {
      return TextEditingValue(
        text: newValue.text.substring(1),
        selection: const TextSelection.collapsed(
          offset: 1,
        ),
      );
    } else if (oldValue.text.isNotEmpty && newValue.text.isEmpty) {
      return const TextEditingValue(
        text: "",
        selection: TextSelection.collapsed(
          offset: 0,
        ),
      );
    } else if (newValue.text.isNotEmpty && double.parse(sanitizedText) == 0) {
      return const TextEditingValue(
        text: "0",
        selection: TextSelection.collapsed(
          offset: 1,
        ),
      );
    } else {
      selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;

      String formattedText = sanitizedText.addCommasToNumber();

      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(
          offset: formattedText.length - selectionIndexFromTheRight,
        ),
      );
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final upperCaseText = newValue.text.toUpperCase();
    return TextEditingValue(
      text: upperCaseText,
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final upperCaseText = newValue.text.toLowerCase();
    return TextEditingValue(
      text: upperCaseText,
      selection: newValue.selection,
    );
  }
}

// ignore_for_file: constant_identifier_names

const List<String> IMAGE_FILE_EXTENSION = [
  '.heif',
  '.jpg',
  '.jpeg',
  '.png',
  '.gif',
  '.webp',
  '.bmp',
  '.wbmp',
  '.raw',
  '.heic',
  '.jfif',
  '.pjpeg',
  '.pjp',
  '.blob'
];

const List<String> VIDEO_FILE_EXTENSIONS = [
  '.webm',
  '.mpg',
  '.mp2',
  '.mpeg',
  '.mpe',
  '.mpv',
  '.ogg',
  '.mp4',
  '.m4p',
  '.m4v',
  '.avi',
  '.wmp',
  '.mov',
  '.qt',
  '.flv',
  '.swf',
  '.avchd'
];


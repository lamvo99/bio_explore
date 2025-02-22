// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Package imports:

// Project imports:

extension DoubleExt on double? {
  String toFormatNumber() {
    if (this == null) {
      return 'null';
    } else if (this == 0) {
      return '0';
    }
    if (this! % 1 == 0) {
      return this!.toInt().toString();
    } else {
      return this!.toStringAsFixed(1);
    }
  }
}

extension NumExt on num? {
  String toCurrency({String separatedPattern = ","}) {
    if (this == null) return "";
    String str = this!.toString();
    if (str.length <= 3) return str;
    return "${((this! ~/ 1000).toCurrency())}$separatedPattern${str.substring(str.length - 3, str.length)}";
  }

  String? get toTimeFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    return dateTime.toHourAndMinute;
  }

  String? get toDateFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    return dateTime.toDayMonthYear();
  }

  String get toHourFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());

    return DateFormat("HH", "vi_VN").format(dateTime);
  }

  String get toDayFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());

    return DateFormat("dd", "vi_VN").format(dateTime);
  }

  String? get toMonthYearFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    return dateTime.monthYear;
  }

  TimeOfDay get toTimeOfDay {
    if (this == null || this == 0) return TimeOfDay.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());

    TimeOfDay timeOfDay =
        TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
    return timeOfDay;
  }

  String? get toDateAndTimeFromMilliseconds {
    if (this == null || this == 0) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    return DateFormat('HH:mm, dd/MM/yyyy').format(dateTime);
  }

  DateTime get toDateTimeFromTimeStamp {
    if (this == null || this == 0) return DateTime.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    return dateTime;
  }

  int get toSinceEpochNow {
    if (this == null || this == 0) return DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this!.toInt());

    DateTime now = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, dateTime.hour, dateTime.minute);

    return now.millisecondsSinceEpoch;
  }

  bool isSameDate(int timePrevious) {
    DateTime dateCurrent = DateTime.fromMillisecondsSinceEpoch(this!.toInt());
    DateTime datePre = DateTime.fromMillisecondsSinceEpoch(timePrevious);
    bool isSame = dateCurrent.year == datePre.year &&
        dateCurrent.month == datePre.month &&
        dateCurrent.day == datePre.day;
    return isSame;
  }

  String formatWithCommas() {
    if (this == null) return "0${i18n.CommonData.Currency}";
    return NumberFormat.currency(
      locale: 'vi_VN',
      symbol: 'đ',
    ).format(this!).replaceAll(RegExp(r'\s+'), '');
  }

  double roundToNearestHalf() {
    if (this == null) return 0;
    return (this! * 2).round() / 2;
  }

  String toPrice() {
    if (this == null || this == 0 || this! < 1000) return "0";

    if (this! == 1000 || this! < 999999) {
      double value = this! / 1000;
      return "${value.toInt()}K";
    } else if (this == 1000000 || this! < 999999999) {
      double value = this! / 1000000;
      return "${value}Tr";
    } else {
      double value = this! / 1000000000;
      return "${value}T";
    }
  }
}

extension IntExt on int? {
  bool get isHaveCount => this == 0;
  bool get isBiggerZeroandNull => this != null && this! > 0;

  DateTime? get toDateTimeFromMilliseconds =>
      this != null ? DateTime.fromMillisecondsSinceEpoch(this!) : null;

  String get toByteFormat {
    if (this == null) return "";
    return "${(this! / 1024 / 1024).toStringAsFixed(2)} MB";
  }

  // String createQrPayment(BankInfo bank, String contentPayment) {
  //   //// Payload Format Indicator
  //   String pFI = "000201";
  //
  //   ////Point of Initiation Method
  //   String pIM = "010212";
  //
  //   ////Consumer Account Information
  //   ///Định danh toàn cầu 1
  //   String gUID = "0010A000000727";
  //
  //   /// Tổ chức ngân hàng thụ hưởng 2
  //   //Acquier ID/BNB ID
  //   String bnbId = "00${bank.bank!.bin!.length.toPad()}${bank.bank!.bin}";
  //   //Merchant ID/Consumer ID
  //   String consumerId =
  //       "01${bank.accountNumber!.length.toPad()}${bank.accountNumber}";
  //   //Banking
  //   String bankId =
  //       "01${(bnbId.length + consumerId.length).toPad()}$bnbId$consumerId";
  //
  //   ///Mã dịch vụ
  //   String codeServices = "0208QRIBFTTA";
  //
  //   String totalAccInfo =
  //       "38${gUID.length + bankId.length + codeServices.length}$gUID$bankId$codeServices";
  //
  //   //// Transaction Currency
  //   String transactionCurrency = "5303704";
  //
  //   ////Transaction Amount
  //   String transactionAnmount = "54${toString().length.toPad()}$this";
  //   String countryCode = "5802VN";
  //   String content = "08${contentPayment.length.toPad()}$contentPayment";
  //   String contentCode = "62${content.length.toPad()}$content";
  //
  //   String dataQr =
  //       "$pFI$pIM$totalAccInfo$transactionCurrency$transactionAnmount$countryCode${contentCode}6304";
  //
  //   final checksum = alcCRC(dataQr);
  //   String crc = checksum.toRadixString(16).toUpperCase();
  //   return "$dataQr$crc";
  // }

  int alcCRC(String str) {
    const List<int> crcTable = [
      0x0000,
      0x1021,
      0x2042,
      0x3063,
      0x4084,
      0x50a5,
      0x60c6,
      0x70e7,
      0x8108,
      0x9129,
      0xa14a,
      0xb16b,
      0xc18c,
      0xd1ad,
      0xe1ce,
      0xf1ef,
      0x1231,
      0x0210,
      0x3273,
      0x2252,
      0x52b5,
      0x4294,
      0x72f7,
      0x62d6,
      0x9339,
      0x8318,
      0xb37b,
      0xa35a,
      0xd3bd,
      0xc39c,
      0xf3ff,
      0xe3de,
      0x2462,
      0x3443,
      0x0420,
      0x1401,
      0x64e6,
      0x74c7,
      0x44a4,
      0x5485,
      0xa56a,
      0xb54b,
      0x8528,
      0x9509,
      0xe5ee,
      0xf5cf,
      0xc5ac,
      0xd58d,
      0x3653,
      0x2672,
      0x1611,
      0x0630,
      0x76d7,
      0x66f6,
      0x5695,
      0x46b4,
      0xb75b,
      0xa77a,
      0x9719,
      0x8738,
      0xf7df,
      0xe7fe,
      0xd79d,
      0xc7bc,
      0x48c4,
      0x58e5,
      0x6886,
      0x78a7,
      0x0840,
      0x1861,
      0x2802,
      0x3823,
      0xc9cc,
      0xd9ed,
      0xe98e,
      0xf9af,
      0x8948,
      0x9969,
      0xa90a,
      0xb92b,
      0x5af5,
      0x4ad4,
      0x7ab7,
      0x6a96,
      0x1a71,
      0x0a50,
      0x3a33,
      0x2a12,
      0xdbfd,
      0xcbdc,
      0xfbbf,
      0xeb9e,
      0x9b79,
      0x8b58,
      0xbb3b,
      0xab1a,
      0x6ca6,
      0x7c87,
      0x4ce4,
      0x5cc5,
      0x2c22,
      0x3c03,
      0x0c60,
      0x1c41,
      0xedae,
      0xfd8f,
      0xcdec,
      0xddcd,
      0xad2a,
      0xbd0b,
      0x8d68,
      0x9d49,
      0x7e97,
      0x6eb6,
      0x5ed5,
      0x4ef4,
      0x3e13,
      0x2e32,
      0x1e51,
      0x0e70,
      0xff9f,
      0xefbe,
      0xdfdd,
      0xcffc,
      0xbf1b,
      0xaf3a,
      0x9f59,
      0x8f78,
      0x9188,
      0x81a9,
      0xb1ca,
      0xa1eb,
      0xd10c,
      0xc12d,
      0xf14e,
      0xe16f,
      0x1080,
      0x00a1,
      0x30c2,
      0x20e3,
      0x5004,
      0x4025,
      0x7046,
      0x6067,
      0x83b9,
      0x9398,
      0xa3fb,
      0xb3da,
      0xc33d,
      0xd31c,
      0xe37f,
      0xf35e,
      0x02b1,
      0x1290,
      0x22f3,
      0x32d2,
      0x4235,
      0x5214,
      0x6277,
      0x7256,
      0xb5ea,
      0xa5cb,
      0x95a8,
      0x8589,
      0xf56e,
      0xe54f,
      0xd52c,
      0xc50d,
      0x34e2,
      0x24c3,
      0x14a0,
      0x0481,
      0x7466,
      0x6447,
      0x5424,
      0x4405,
      0xa7db,
      0xb7fa,
      0x8799,
      0x97b8,
      0xe75f,
      0xf77e,
      0xc71d,
      0xd73c,
      0x26d3,
      0x36f2,
      0x0691,
      0x16b0,
      0x6657,
      0x7676,
      0x4615,
      0x5634,
      0xd94c,
      0xc96d,
      0xf90e,
      0xe92f,
      0x99c8,
      0x89e9,
      0xb98a,
      0xa9ab,
      0x5844,
      0x4865,
      0x7806,
      0x6827,
      0x18c0,
      0x08e1,
      0x3882,
      0x28a3,
      0xcb7d,
      0xdb5c,
      0xeb3f,
      0xfb1e,
      0x8bf9,
      0x9bd8,
      0xabbb,
      0xbb9a,
      0x4a75,
      0x5a54,
      0x6a37,
      0x7a16,
      0x0af1,
      0x1ad0,
      0x2ab3,
      0x3a92,
      0xfd2e,
      0xed0f,
      0xdd6c,
      0xcd4d,
      0xbdaa,
      0xad8b,
      0x9de8,
      0x8dc9,
      0x7c26,
      0x6c07,
      0x5c64,
      0x4c45,
      0x3ca2,
      0x2c83,
      0x1ce0,
      0x0cc1,
      0xef1f,
      0xff3e,
      0xcf5d,
      0xdf7c,
      0xaf9b,
      0xbfba,
      0x8fd9,
      0x9ff8,
      0x6e17,
      0x7e36,
      0x4e55,
      0x5e74,
      0x2e93,
      0x3eb2,
      0x0ed1,
      0x1ef0,
    ];

    var crc = 0xffff;

    for (var i = 0; i < str.length; i++) {
      var c = str.codeUnitAt(i);
      if (c > 255) {
        throw RangeError('Character out of range');
      }
      var j = (c ^ (crc >> 8)) & 0xff;
      crc = crcTable[j] ^ (crc << 8);
    }

    return (crc ^ 0) & 0xffff;
  }

  String toPad() {
    if (this! < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }
}

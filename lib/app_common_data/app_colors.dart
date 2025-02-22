// Flutter imports:
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// ******************** YOUR CUSTOM COLOR HERE ********************

  /*
      Primary Colors (Apply for all widget)
  */
  //Gray Color
  static const Color gray25 = Color(0xFFFCFCFD);
  static const Color gray50 = Color(0xFFF8FAFC);
  static const Color gray100 = Color(0xFFEEF2F6);
  static const Color gray200 = Color(0xFFE3E8EF);
  static const Color gray300 = Color(0xFFCDD5DF);
  static const Color gray400 = Color(0xFF9AA4B2);
  static const Color gray500 = Color(0xFF697586);
  static const Color gray600 = Color(0xFF4B5565);
  static const Color gray700 = Color(0xFF364152);
  static const Color gray800 = Color(0xFF202939);
  static const Color gray900 = Color(0xFF121926);
  static const Color gray950 = Color(0xFF0D121C);

  //
  //Yellow Color
  static const Color yellow25 = Color(0xFFFEFDF0);
  static const Color yellow50 = Color(0xFFFEFBE8);
  static const Color yellow100 = Color(0xFFFEF7C3);
  static const Color yellow200 = Color(0xFFFEEE95);
  static const Color yellow300 = Color(0xFFFFDA43);
  static const Color yellow400 = Color(0xFFFAC515);
  static const Color yellow500 = Color(0xFFEAAA08);
  static const Color yellow600 = Color(0xFFCA8504);
  static const Color yellow700 = Color(0xFFA15C07);
  static const Color yellow800 = Color(0xFF854A0E);
  static const Color yellow900 = Color(0xFF713B12);
  static const Color yellow950 = Color(0xFF542C0D);

  //
  ///Primary Color
  static const Color primary25 = Color(0xFFF6FEFC);
  static const Color primary50 = Color(0xFFF0FDF9);
  static const Color primary100 = Color(0xFFCCFBEF);
  static const Color primary200 = Color(0xFF99F6E0);
  static const Color primary300 = Color(0xFF5FE9D0);
  static const Color primary400 = Color(0xFF2ED3B7);
  static const Color primary500 = Color(0xFF15B79E);
  static const Color primary600 = Color(0xFF0E9384);
  static const Color primary700 = Color(0xFF0E9384);
  static const Color primary800 = Color(0xFF125D56);
  static const Color primary900 = Color(0xFF134E48);
  static const Color primary950 = Color(0xFF0A2926);

  //

  ///Error
  static const Color error25 = Color(0xFFFFFBFA);
  static const Color error50 = Color(0xFFFEF3F2);
  static const Color error100 = Color(0xFFFEE4E2);
  static const Color error200 = Color(0xFFFECDCA);
  static const Color error300 = Color(0xFFFDA29B);
  static const Color error400 = Color(0xFFF97066);
  static const Color error500 = Color(0xFFF04438);
  static const Color error600 = Color(0xFFD92D20);
  static const Color error700 = Color(0xFFB42318);
  static const Color error800 = Color(0xFF912018);
  static const Color error900 = Color(0xFF7A271A);
  static const Color error950 = Color(0xFF55160C);

  //

  ///waning
  static const Color warning25 = Color(0xFFFFFCF5);
  static const Color warning50 = Color(0xFFFFFAEB);
  static const Color warning100 = Color(0xFFFEF0C7);
  static const Color warning200 = Color(0xFFFEDF89);
  static const Color warning300 = Color(0xFFFEC84B);
  static const Color warning400 = Color(0xFFFDB022);
  static const Color warning500 = Color(0xFFF7900A);
  static const Color warning600 = Color(0xFFDC6803);
  static const Color warning700 = Color(0xFFB54708);
  static const Color warning800 = Color(0xFF93370D);
  static const Color warning900 = Color(0xFF7A2E0E);
  static const Color warning950 = Color(0xFF4E1D09);

  //

  ///success
  static const Color success25 = Color(0xFFF6FEF9);
  static const Color success50 = Color(0xFFECFDF3);
  static const Color success100 = Color(0xFFDCFAE6);
  static const Color success200 = Color(0xFFABEFC6);
  static const Color success300 = Color(0xFF75E0A7);
  static const Color success400 = Color(0xFF47CD89);
  static const Color success500 = Color(0xFF17B26A);
  static const Color success600 = Color(0xFF079455);
  static const Color success700 = Color(0xFF067647);
  static const Color success800 = Color(0xFF085D3A);
  static const Color success900 = Color(0xFF074D31);
  static const Color success950 = Color(0xFF053321);

  //

  static const Color blue25 = Color(0xFFF5F8FF);
  static const Color blue50 = Color(0xFFEEF4FF);
  static const Color blue100 = Color(0xFFE0EAFF);
  static const Color blue200 = Color(0xFFC7D7FE);
  static const Color blue300 = Color(0xFFA4BCFD);
  static const Color blue400 = Color(0xFF8098F9);
  static const Color blue500 = Color(0xFF6172F3);
  static const Color blue600 = Color(0xFF444CE7);
  static const Color blue700 = Color(0xFF3538CD);
  static const Color blue800 = Color(0xFF2D31A6);
  static const Color blue900 = Color(0xFF2D3282);
  static const Color blue950 = Color(0xFF1F235B);

  //////Purple
  static const Color purple50 = Color(0xFFF9F5FF);
  static const Color purple400 = Color(0xFFB692F6);
  static const Color purple600 = Color(0xFF7F56D9);

  /// Gradient ///
  static const Gradient gradient01 = LinearGradient(
    begin: Alignment(-0.98, -0.11), // Adjust for desired direction
    end: Alignment(0.99, 0.12), // Adjust for desired direction
    colors: [
      Color(0xFF9BD8DD), // Base color from CSS
      Color(0xFF9DD8DC), // End color from CSS
    ],
  );

  ///
  static const Color accent01 = Color(0xFF15B79E);
  static const Color linear = Color(0xFF9BD8DD);
  static const Color bgPrimarySecondary = Color(0xFFF4F6F7);

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.14), // Adjust opacity as needed
      blurRadius: 1.0,
      spreadRadius: 0.0,
      offset: const Offset(0.0, -1.0), // Move shadow 1px up
    ),
  ];

  static List<BoxShadow> shadow2 = [
    const BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.10),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    const BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.06),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  ///
  static const Color primaryBgHover = Color(0xFFF9FAFB);
  static const Color basicGrey = Color(0xFFCDD6DF);
  static const Color primaryColor = Color(0xFF08979C);
  static const Color primaryBorderColor = Color(0xFFCDD6DF);
  static const Color primaryLightColor = Color(0xFF15B79E);
  static const Color primaryImageBackground = Color(0xFFCDD6DF);
  static const Color primaryBackground = Color(0xFFF5F5F5);

  // Primary
  // Common
  /*
  Banner Background Colors
  */
  static const Color bg = Color(0xFFF5F5F5);
  static const Color bgSuccess = Color(0xFFE6FFFB);
  static const Color bgError = Color(0xFFFFF1F0);
  static const Color bgWarning = Color(0xFFFFFBE6);
  static const Color bgInfo = Color(0xFFd1fafa);

  ///
  /// Basic Colors (12)
  ///
  static const Color red = Color(0xffE02D3C);
  static const Color yellow = Colors.yellow;
  static const Color green = Color(0xFF08875D);
  static const Color blue = Color(0xFF96EFFF);
  static const Color pink = Color(0xFFE7BCDE);
  static const Color orange = Colors.orange;
  static const Color purple = Color(0xff713ABE);
  static const Color grey = Color(0xFFCDD6DF);
  static const Color brown = Color(0xFFB0A695);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}

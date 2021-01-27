import 'package:flutter/material.dart';

/*=====================================================================================================================
TEMA DE LA APLICACION
=====================================================================================================================*/

const String fontName = 'WorkSans';

final kTitleAppBar = TextStyle(
  color: ThemeDefault.themeWhite,
  fontFamily: 'CM Sans Serif',
  fontSize: 24,
);

var kTitleStyleBlack = TextStyle(
  color: ThemeDefault.themeWhite,
  fontFamily: 'CM Sans Serif',
  fontSize: 20.0,
  height: 1.0,
);

final kSubTitleCardStyle = TextStyle(
  color: ThemeDefault.themeWhite,
  fontSize: 15,
  fontWeight: FontWeight.w600,
  height: 1.5,
);

final kSubSubTitleCardStyle = TextStyle(
  color: ThemeDefault.themeWhite,
  fontSize: 13,
  fontWeight: FontWeight.w600,
  height: 1.5,
);

final kSubtitleStyleWhite = TextStyle(
  color: ThemeDefault.themeWhite,
  fontFamily: 'CM Sans Serif',
  fontSize: 16.0,
  height: 1.1,
);

class ThemeDefault {
  ThemeDefault._();

  static const Color themeWhite = Colors.white;
  static const Color themeBlack = Colors.black;
  static const Color themePlomo = Color(0xFF606062);
  static const Color themeAmarillo = Color(0xFFF4EB00);
  static const Color themeMostaza = Color(0xFFECEC09);
  static const Color themeMostazaOscuro = Color(0xFFBFB634);

/*=====================================================================================================================
TEMA PARA LOS CONTROLES UI
=====================================================================================================================*/

  static const Color uiBotonPrimario = Color(0xFF606062);
  static const Color uiTextoBoton = Color(0xFFF4EB00);

  static const TextStyle uiTextoStyleNegrilla = TextStyle(
    fontWeight: FontWeight.bold,
  );
}

import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#FFFFFF');
  static Color secondary = HexColor.fromHex('#FFD104');
  static Color tertiary = HexColor.fromHex('#000000');
  static Color hintTextColor = HexColor.fromHex('#AAAAAA');
  static Color textColor = HexColor.fromHex('#3B3B3B');
  static Color policyTextColor = HexColor.fromHex('#5E5E5E');
  static Color emailTextColor = HexColor.fromHex('#050505');
  static Color borderColor = HexColor.fromHex('#A0A0A0');
  static Color containerTextColor = HexColor.fromHex('#FF0B0B');
  static Color containerText1Color = HexColor.fromHex('#A3002B');
  static Color containerText2Color = HexColor.fromHex('#8DF989');
  static Color containerText3Color = HexColor.fromHex('#00A249');
  static Color containerText4Color = HexColor.fromHex('#7A78FF');
  static Color containerText5Color = HexColor.fromHex('#1B18D9');
  static Color unselectedLabelColor = HexColor.fromHex('#7E7E7E');
  static Color rateColor = HexColor.fromHex('#DF023D');
  static Color unselectedStepColor = HexColor.fromHex('#868686');
  static Color text2Color = HexColor.fromHex('#6D6D6D');
  static Color dataCellColor = HexColor.fromHex('#B9B9B9');
  static Color buttonNavColor = HexColor.fromHex('#D9D9D9');
  static Color previewButtonColor = HexColor.fromHex('#515151');
  static Color priceColor = HexColor.fromHex('#818181');
  static Color priceDetailColor = HexColor.fromHex('#1F1F1F');
  static Color winColor = HexColor.fromHex('#00813A');
  static Color textFieldColor = HexColor.fromHex('#E9E9E9');
  static Color backgroundColor = HexColor.fromHex('#22CA00');
  static Color containerEMRColor = HexColor.fromHex('#010101');
  static Color containerBatColor = HexColor.fromHex('#DBDBDB');
  static Color playerNameColor = HexColor.fromHex('#2C64FD');
  static Color playerNameColor1 = HexColor.fromHex('#929292');
  static Color livePlayerNameColor1 = HexColor.fromHex('#5F5F5F');
  static Color completedContainerColor = HexColor.fromHex('#D9D9D9');
  static Color tabTextColor = HexColor.fromHex('#1B18D9');
  static Color unselectedTabTextColor = HexColor.fromHex('#7E7E7E');
  static Color arrowBackColor = HexColor.fromHex('#222222');
}

extension HexColor on Color {
  static Color fromHex(String hexColorSting) {
    hexColorSting = hexColorSting.replaceAll('#', '');
    if (hexColorSting.length == 6) {
      hexColorSting = 'FF' + hexColorSting;
    }
    return Color(int.parse(hexColorSting, radix: 16));
  }
}

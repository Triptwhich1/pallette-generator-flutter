import 'dart:math';

String hexColorGenerator() {
  String hexColor = '0xFF';
  for (int i = 0; i < 6; i++) {
    hexColor += Random().nextInt(16).toRadixString(16);
  }
  return hexColor;
}

String generatePrimaryColor() {
  return hexColorGenerator();
}
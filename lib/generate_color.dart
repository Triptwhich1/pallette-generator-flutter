import 'dart:math';
import 'package:flutter/material.dart';

String hexColorGenerator() {
  // Generates Hex Colours
  String hexColor = '0xFF';
  for (int i = 0; i < 6; i++) {
    hexColor += Random().nextInt(16).toRadixString(16);
  }
  return hexColor;
}

String generateLighterColours() {
  // Generates lighter colours
  String hexColor = '0xFF';
  int min = 12;
  int max = 16;
  for (int i = 0; i < 6; i++) {
    print(hexColor += Random().nextInt((max + 4)).toRadixString(16));
  }
  print(hexColor);
  return hexColor;
}

String generatePrimaryColor() {
  // Generates the primary colour
  return hexColorGenerator();
}

String generateAccentColor(String passedColor) {
  String hslColor = hexToRGB(passedColor);
  // print(hslColor);
  var hslList = hslColor.split(', ');
  var h = int.parse(hslList[0]);
  var s = int.parse(hslList[1]);
  var l = int.parse(hslList[2]);

  h -= 20;

  return '$h, $s, $l';
}

Color createAccentColour(passedColor) {
  // Generates an accent colour
  String hsl = generateAccentColor(passedColor);
  String rgb = hslToRgb(hsl);
  String returnedValue = RGBtoHex(rgb);
  var color = '0xFF$returnedValue';
  return Color(int.parse(color));
  // return Color(int.parse(returnedValue), radix: 16);
}

String hexToRGB(String color) {
  // https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion obtained here, and implemented
  var hexColor = color.substring(4);

  var r = int.parse(hexColor.substring(0, 2), radix: 16);
  var g = int.parse(hexColor.substring(2, 4), radix: 16);
  var b = int.parse(hexColor.substring(4, 6), radix: 16);

  String rgb = '$r, $g, $b';
  return rgb;
}

String rgbToHSL(String rgb) {
  // rgb to hsl conversion
  var rgbList = rgb.split(', ');
  var r1 = num.parse(rgbList[0]);
  var g1 = num.parse(rgbList[1]);
  var b1 = num.parse(rgbList[2]);

  var r2 = r1 / 255;
  var g2 = g1 / 255;
  var b2 = b1 / 255;

  var cMax = max(r2, max(g2, b2));
  var cMin = min(r2, min(g2, b2));
  var delta = cMax - cMin;

  var h, s, l = (cMax + cMin) / 2;

  if (delta == 0) {
    h = 0;
    s = 0;
  }

  s = l > 0.5 ? delta / (2 - cMax - cMin) : delta / (cMax + cMin);

  if (cMax == r2) {
    h = (g2 - b2) / delta + (g2 < b2 ? 6 : 0);
  } else if (cMax == g2) {
    h = (b2 - r2) / delta + 2;
  } else {
    h = (r2 - g2) / delta + 4;
  }

  h *= 60;

  return '$h, $s, $l';
}

String hslToRgb(String hsl) {
  // hsl to rgb conversion
  var hslList = hsl.split(', ');
  var h = num.parse(hslList[0]);
  var s = num.parse(hslList[1]);
  var l = num.parse(hslList[2]);
  num r, g, b;

  if (s == 0) {
    r = g = b = l; // achromatic
  } else {
    var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
    var p = 2 * l - q;
    r = hueToRgb(p, q, h + 1 / 3);
    g = hueToRgb(p, q, h);
    b = hueToRgb(p, q, h - 1 / 3);
  }

  return '${(r * 255).round()}, ${(g * 255).round()}, ${(b * 255).round()}';
}

num hueToRgb(p, q, t) {
  // Hue to rgb conversion
  if (t < 0) t += 1;
  if (t > 1) t -= 1;
  if (t < 1 / 6) return p + (q - p) * 6 * t;
  if (t < 1 / 2) return q;
  if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
  return p;
}

String RGBtoHex(String rgb) {
  // RGB to hex conversion
  var rgbList = rgb.split(', ');
  int r = int.parse(rgbList[0]);
  int g = int.parse(rgbList[1]);
  int b = int.parse(rgbList[2]);

  String hex = 'rgb(${r.toString()}, ${g.toString()}, ${b.toString()})';
  return hex;
}

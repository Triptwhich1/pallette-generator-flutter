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

String generateAccentColor(String passedColor) {
  String color = passedColor.substring(4);
  String hslColor = hexToRGB(color);
  print(hslColor);
  var hslList = hslColor.split(', ');
  var h = int.parse(hslList[0]);
  var s = int.parse(hslList[1]);
  var l = int.parse(hslList[2]);

  h -= 20;

  return 'hsl($h, $s%, $l%)';
}

String createAccentColour(String passedColor) {
  String hsl = generateAccentColor(passedColor);
  String rgb = hslToRGB(hsl);
  return RGBtoHex(rgb);
}

String hexToRGB(String color) { // https://stackoverflow.com/questions/2353211/hsl-to-rgb-color-conversion
  var hexColor = color.substring(4);
 
  var r = int.parse(hexColor.substring(0, 2), radix: 16);
  var g = int.parse(hexColor.substring(2, 4), radix: 16);
  var b = int.parse(hexColor.substring(4, 6), radix:16);

  String rgb = '$r, $g, $b';
  return rgb;
}

String rgbToHSL(String rgb) {
  var rgbList = rgb.split(', ');
  var r1 = int.parse(rgbList[0]);
  var g1 = int.parse(rgbList[1]);
  var b1 = int.parse(rgbList[2]);

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

  s = l > 0.5? delta / (2 - cMax - cMin) : delta / (cMax + cMin);

  if (cMax == r2) {h = (g2 - b2) / delta + (g2 < b2 ? 6 : 0);}
  else if (cMax == g2) {h = (b2 - r2) / delta + 2;}
  else {h = (r2 - g2) / delta + 4;}

  h *= 60;

  return '$h, $s, $l';
}

String hslToRGB(String hsl) {
  var hslList = hsl.split(', ');
  var h = num.parse(hslList[0]);
  var s = num.parse(hslList[1]);
  var l = num.parse(hslList[2]);

  num q = l < 0.5 ? l * (1 + s) : l + s - l * s;
  num p = 2 * l - q;

  var r = hueToRGB(p, q, h / 360 + 1/3);
  var g = hueToRGB(p, q, h / 360);
  var b = hueToRGB(p, q, h / 360 - 1/3);


  return '${(r * 255).round()}, ${(g * 255).round()}, ${(b * 255).round()}';
}

num hueToRGB (num p, num q, num t) {
  if (t < 0) t += 1;
  if (t > 1) t -= 1;
  if (t < 1/6) return (p + (q - p) * 6 * t);
  if (t < 1/2) return q;
  if (t < 2/3) return (p + (q - p) * (2/3 - t) * 6);
  return p;
}

String RGBtoHex(String rgb) {
  var rgbList = rgb.split(', ');
  var r = int.parse(rgbList[0]);
  var g = int.parse(rgbList[1]);
  var b = int.parse(rgbList[2]);

  String hex = r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16);
  return hex;
}
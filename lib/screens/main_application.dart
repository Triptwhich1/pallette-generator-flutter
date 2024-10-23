import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pallette_generator/generate_color.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colorContainerDisplay = 175.0;
  List<Color> colors = [];
  List<String> colorName = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      String colorHex = hexColorGenerator();
      colors.add(Color(int.parse(colorHex)));
      colorName.add(colorHex);
    }
    for (int i = 0; i < 2; i++) {
      String colorHex = generateLighterColours();
      colors.add(Color(int.parse(colorHex)));
      colorName.add(colorHex);
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Palette Generator',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF343434),
        primarySwatch: Colors.orange,

      ),
      home: Scaffold(
        body: 
        Column(
          children: [
          const SizedBox(height: 50),
          Container(         
          padding: const EdgeInsets.all(5),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[0].substring(4).toUpperCase()));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: colorContainerDisplay,
                height: colorContainerDisplay,
                decoration: BoxDecoration(
                  color: colors[0],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ]
                ),
                child: Text(
                  colorName[0].substring(4).toUpperCase()),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[1].substring(4).toUpperCase()));
              },
              child: Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[1],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
              ]
              ),
              child: Text(
                colorName[1].substring(4).toUpperCase(),
              ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
          ]
          )
          ),
          Container(         
          padding: const EdgeInsets.all(5),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[2].substring(4).toUpperCase()));
              },
              child: Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[2],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ]
              ),
              child: Text(
                colorName[2].substring(4).toUpperCase()),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[3].substring(4).toUpperCase()));
              },
              child: Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[3],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ]
              ),
              child: Text(
                colorName[3].substring(4).toUpperCase()),
              ),
            ),
          const Padding(padding: EdgeInsets.all(5)),
          ]
          )
          ),
          Column(
          children: [
          Container(         
          padding: const EdgeInsets.all(5),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[4].substring(4).toUpperCase()));
              },
            child:
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[4],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ]
              ),
              child: Text(
                colorName[4].substring(4).toUpperCase()),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: colorName[5].substring(4).toUpperCase()));
              },
            child: 
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[5],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ]
              ),
              child: Text(
                colorName[5].substring(4).toUpperCase()),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
          ]
          )
          ),    
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFF444444),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
              onPressed: () {
                // print(rgbToHSL(hexToRGB(colorName[0])));
                // print(generateAccentColor(colorName[0]));
                // print(colorName[0]);
                // print(hexToRGB(colorName[0]));
                // var testingColor = (rgbToHSL(hexToRGB(colorName[0])));
                // print(testingColor);
                // print(hslToRgb(testingColor));
                // print(RGBtoHex(hslToRgb(testingColor)));
                // print(colorName[0]);
                // print(createAccentColour(colorName[0]).toString());
                setState(() {
                  colors.clear();
                  colorName.clear();
                  for (int i = 0; i < 6; i++) {
                    String colorHex = hexColorGenerator();
                    colors.add(Color(int.parse(colorHex)));
                    colorName.add(colorHex);
                  }
                });
              },
              child: const Text('Generate Palette',
              style: TextStyle(color: Colors.white))
          )
          )
          ]
        )
        ]
        ) 
      )
    );
  }
}

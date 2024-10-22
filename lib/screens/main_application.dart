import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pallette_generator/generate_color.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colorContainerDisplay = 175.0;


  @override
  Widget build(BuildContext context) {
    List<Color> colors = [];
    List<String> colorName = [];

    for (int i = 0; i < 6; i++) {
      colors.add(Color(int.parse(hexColorGenerator())));
      colorName.add(hexColorGenerator());
    }   

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
          SizedBox(height: 50),
          Container(         
          padding: const EdgeInsets.all(5),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[0],
              child: Text(
                colorName[0].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[1],
              child: Text(
                colorName[1].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
          ]
          )
          ),
          Container(         
          padding: const EdgeInsets.all(5),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[2],
              child: Text(
                colorName[2].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[3],
              child: Text(
                colorName[3].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
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
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[4],
              child: Text(
                colorName[4].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: colorContainerDisplay,
              height: colorContainerDisplay,
              color: colors[5],
              child: Text(
                colorName[5].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
          ]
          )
          ),    
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                // print(rgbToHSL(hexToRGB(colorName[0])));
                // print(generateAccentColor(colorName[0]));
                print(colorName[0]);
                print(hexToRGB(colorName[0]));
                var testingColor = (rgbToHSL(hexToRGB(colorName[0])));
                print(testingColor);
                print(hslToRGB(testingColor));
                print(RGBtoHex(hslToRGB(testingColor)));
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
              child: const Text('Generate Palette'),
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

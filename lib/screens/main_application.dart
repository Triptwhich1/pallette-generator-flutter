import 'package:flutter/material.dart';
import 'package:pallette_generator/generate_color.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          Container(         
          padding: const EdgeInsets.all(10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[0],
              child: Text(
                colorName[0].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[1],
              child: Text(
                colorName[1].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[2],
              child: Text(
                colorName[2].substring(4).toUpperCase()),
            )
          ]
          )
          ),
          Container(         
          padding: const EdgeInsets.all(10),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[3],
              child: Text(
                colorName[3].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[4],
              child: Text(
                colorName[4].substring(4).toUpperCase()),
              ),
            Padding(padding: const EdgeInsets.all(5)),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              color: colors[5],
              child: Text(
                colorName[5].substring(4).toUpperCase()),
            )
          ]
          )
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  print('Button Pressed');
                  colors.clear();
                  colorName.clear();
                  for (int i = 0; i < 6; i++) {
                    String colorHex = hexColorGenerator();
                    print('Generated Color: $colorHex');
                    colors.add(Color(int.parse(colorHex)));
                    colorName.add(colorHex);
                  }
                  print('Colors: $colors');
                  print('Color Names: $colorName');
                });
              },
              child: const Text('Generate Palette'),
            )
          )
          ]
        )
      )
    );
  }
}

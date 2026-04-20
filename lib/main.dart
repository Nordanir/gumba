import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/classes/symbols.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widget_text.dart';
import 'package:gumba/widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/home" : (context) => HomePage()} ,
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: fairyGumba,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  canvasColor,
      body: HomePage(),
    );
  }
}
 Mushroom testMushroom = Mushroom(
    id: '1',
    flesh: 'This is a test mushroom.',
    culinaryUse: 'Edible',
    name: 'Test Mushroom',
    latinName: 'Testus mushroomus',
    occurrence: 'Common',
    activeMonths: [1,8,9,10],
    symbols: [GumbaSymbols.edible.value, GumbaSymbols.growsInGrassLand.value ]
  );


 
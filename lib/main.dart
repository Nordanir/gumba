import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/classes/symbols.dart';
import 'package:gumba/data_controller.dart';
import 'package:gumba/display_controller.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widget_text.dart';
import 'package:gumba/widgets/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MushroomEncyclopedia(mushrooms: [])),
        Provider(create: (_) => SavedMushrooms(mushrooms: [])),
        ChangeNotifierProvider<DisplayController>(create: (_) => DisplayController()),
      ],
      child: MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: fairyGumba,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  void initState() {
 super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    final encyclopedia = await  IOController.getMushroomsFromJson();
    Provider.of<MushroomEncyclopedia>(context, listen: false).addMushrooms(encyclopedia);
    final displayController = Provider.of<DisplayController>(context, listen: false);
    displayController.setDisplayedMushrooms = encyclopedia;
   
    logger.i("Home page initialized");
    });

    //IOController.saveMushroomsToJson(testMushrooms);
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/gumba_canvas.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: HomePage()
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


 
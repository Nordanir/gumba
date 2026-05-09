import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
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

/// This is app is a mushroom encyclopedia applicaion
///  which supports profiles, collections.
///  On desktop platforms book scraping is possible.
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MushroomEncyclopedia(mushrooms: [])),
        Provider(create: (_) => SavedMushrooms(mushrooms: [])),
        ChangeNotifierProvider<DisplayController>(
          create: (_) => DisplayController(),
        ),
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

/// HomePage is the only route in the app currently.
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({required this.title, super.key});

  /// Application's title
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final encyclopedia = await IOController.getMushroomsFromJson();
      Provider.of<MushroomEncyclopedia>(
        context,
        listen: false,
      ).mushrooms.addAll(encyclopedia);
      Provider.of<DisplayController>(
        context,
        listen: false,
      )
      .displayedMushrooms = encyclopedia;

      logger.i('Home page initialized');
    });

    //IOController.saveMushroomsToJson(testMushrooms);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/gumba_canvas.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const HomePage(),
    );
  }
}

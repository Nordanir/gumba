import 'package:flutter/material.dart';

import 'package:gumba/display_controller.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widgets/action_bar.dart';
import 'package:gumba/widgets/appbar.dart';
import 'package:gumba/widgets/gumba_list.dart';
import 'package:provider/provider.dart';

///The only route in the app handles all the display currently
class HomePage extends StatefulWidget {
  ///
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final displayedMushrooms = Provider.of<DisplayController>(
      context,
    ).displayedMushrooms;
    return Container(
      
      padding: const EdgeInsets.all(AppBorderRadius.large),
      child: Column(
        children: [
          const GumbaAppBar(),
          const ActionBar(),
          GumbaList(mushrooms: displayedMushrooms),
        ],
      ),
    );
  }
}

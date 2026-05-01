import 'package:flutter/material.dart';

import 'package:gumba/display_controller.dart';
import 'package:gumba/widgets/appbar.dart';
import 'package:gumba/widgets/gumba_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final displayedMushrooms = Provider.of<DisplayController>(context, listen: true).getDisplayedMushrooms;
    return Column(
        children: [
           const GumbaAppBar(),
          GumbaList(mushrooms: displayedMushrooms)
        ],
      );
  }
}
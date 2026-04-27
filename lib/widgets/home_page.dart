import 'package:flutter/material.dart';
import 'package:gumba/classes/test_mushrooms.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widgets/appbar.dart';
import 'package:gumba/widgets/gumba_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const GumbaAppBar(),
          GumbaList(mushrooms: testMushrooms)
        ],
      );
  }
}
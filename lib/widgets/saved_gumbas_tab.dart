import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/data_controller.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widgets/appbar.dart';
import 'package:gumba/widgets/gumba_list.dart';
import 'package:provider/provider.dart';


class SavedGumbasTab extends StatelessWidget {
  const SavedGumbasTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    return Container(
      height: appSize.height ,
      width: appSize.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImagePaths.canvasImage)) 
      ),
      child: Column(
        children: [
          GumbaAppBar()

        ],
      ),
    );
  }
}

class DisplaySavedGumbas extends StatelessWidget {
  const DisplaySavedGumbas({super.key});
  @override
  Widget build(BuildContext context) {
    DataController dataController = DataController();
    final SavedMushrooms savedMushrooms = Provider.of<SavedMushrooms>(context);
   
    return GumbaList(mushrooms: dataController.getSaved(savedMushrooms));
  }
}
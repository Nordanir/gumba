import 'package:flutter/widgets.dart';
import 'package:gumba/classes/mushroom.dart';

class DisplayController with ChangeNotifier {
  List<Mushroom> _displayedMushrooms = [];
 List<Mushroom> get getDisplayedMushrooms => _displayedMushrooms;
 set setDisplayedMushrooms(List<Mushroom> displayedMushrooms) =>{_displayedMushrooms = displayedMushrooms, notifyListeners()};
}
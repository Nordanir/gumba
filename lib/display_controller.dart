import 'package:flutter/widgets.dart';
import 'package:gumba/classes/mushroom.dart';

/// This class manages what mushrooms are displayed in the UI.
class DisplayController with ChangeNotifier {
  List<Mushroom> _displayedMushrooms = [];

  ///
  List<Mushroom> get displayedMushrooms => _displayedMushrooms;

  /// This method updates the list of displayed mushrooms 
  /// notifies listeners to rebuild the UI.
  set displayedMushrooms(List<Mushroom> displayedMushrooms) => {
    _displayedMushrooms = displayedMushrooms,
    notifyListeners(),
  };
}

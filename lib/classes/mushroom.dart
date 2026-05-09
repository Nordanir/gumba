import 'package:gumba/classes/symbols.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mushroom.g.dart';

@JsonSerializable()
/// This class represents a real mushroom with all describing properties.
class Mushroom {
  /// Fields marked required are information
  /// that is always should be present for a mushroom.
  Mushroom({
    required this.id,
    required this.name,
    required this.latinName,
    required this.flesh,
    required this.culinaryUse,
    required this.activeMonths,
    required this.symbols,
    required this.occurrence,
    this.type,
    this.cap,
    this.imageUrl,
    this.stem,
    this.gills,
    this.frutingLayer,
    this.hymenium,
  });

  /// Helper methods for JSON serialization
  factory Mushroom.fromJson(Map<String, dynamic> json) =>
      _$MushroomFromJson(json);

  /// Describes the type of the mushroom
  /// (currently 3 types : pipe, disc, neither).
  String? type;

  /// Unique ID for database purposes which may be implemented in the future.
  String id;

  /// Common name of the mushroom in the language of book it is scraped from.
  String name;

  /// Binomial name of the mushroom in latin.
  String latinName;

  /// Information about the mushroom's cap (if applicable).
  String? cap;

  /// URL to the image of the mushroom (if exists).
  String? imageUrl;

  /// Information about the mushroom's stem(if applicable).
  String? stem;

  /// Information about the mushroom's gills (if applicable).
  String? gills;

  /// Information about the mushroom's flesh (if applicable).
  String flesh;

  /// Information about the mushroom's culinary use(if applicable).
  String culinaryUse;

  /// Information about the where and when
  /// the mushroom can be found (if applicable).
  String occurrence;

  /// Information about the mushroom's fruting layer (if applicable).
  String? frutingLayer;

  /// Information about the mushroom's hymenium (if applicable).
  String? hymenium;

  /// A list of symbols associated with the mushroom.
  List<GumbaSymbol> symbols;

  /// A list of integers representing the active months for the mushroom.
  List<int> activeMonths;

  /// Helper method to convert the mushroom object to JSON format.
  Map<String, dynamic> toJson() => _$MushroomToJson(this);
}

/// Data class to represent the list of mushrooms
/// that are scraped from the books provided.
/// These are stored locally.
class MushroomEncyclopedia {
  ///
  MushroomEncyclopedia({required this.mushrooms});

  ///
  final List<Mushroom> mushrooms;
}

/// Data class representing the profile's saved mushrooms list,
/// which is stored locally on the user's device.
class SavedMushrooms {
  ///
  SavedMushrooms({required this.mushrooms});

  ///
  final List<Mushroom> mushrooms;
}

import 'package:gumba/style.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symbols.g.dart';

@JsonSerializable()
/// This class represents symbols
/// which is used to provide quick information about the mushroom.
class GumbaSymbol {
  ///
  const GumbaSymbol({
    required this.name,
    required this.description,
    required this.iconPath,
  });

  /// Helper methods for JSON serialization
  factory GumbaSymbol.fromJson(Map<String, dynamic> json) =>
      _$GumbaSymbolFromJson(json);

  /// The name of the symbol, e.g. "Edible", "Poisonous", etc.
  final String name;

  /// A brief description of what the symbol means.
  final String description;

  /// The path to the icon image representing the symbol.
  final String iconPath;

  /// Converts the GumbaSymbol instance to a JSON map.
  Map<String, dynamic> toJson() => _$GumbaSymbolToJson(this);
}

/// presents the different symbols that can be associated with a mushroom.
enum GumbaSymbols {
  /// The mushroom is safe to eat.
  edible(
    GumbaSymbol(
      name: 'Edible',
      description: 'This mushroom is safe to eat.',
      iconPath: AppImagePaths.edibleIconImage,
    ),
  ),

  /// The mushroom needs some form of preparation to be safe to eat.
  conditionallyEdible(
    GumbaSymbol(
      name: 'Conditionally Edible',
      description: 'This mushroom is safe to eat when properly prepared.',
      iconPath: AppImagePaths.conditionallyEdibleIconImage,
    ),
  ),

  /// This mushroom is not safe to eat.
  notEdible(
    GumbaSymbol(
      name: 'Not Edible',
      description: 'This mushroom is not safe to eat.',
      iconPath: AppImagePaths.notEdibleIconImage,
    ),
  ),

  /// This mushroom is toxic and can cause illness or death if ingested.
  poisonous(
    GumbaSymbol(
      name: 'Poisonous',
      description:
          'This mushroom is toxic and can cause illness or death if ingested.',
      iconPath: AppImagePaths.poisonousIconImage,
    ),
  ),

  /// It can be sold in Hungary (this is only meaningful for us :P)
  canBeSoldInHungary(
    GumbaSymbol(
      name: 'Can be sold in Hungary',
      description: 'This mushroom can be legally sold in Hungary.',
      iconPath: AppImagePaths.canBeSoldInHungaryIconImage,
    ),
  ),

  /// This mushroom is considered protected by law
  ///  cannot be harvested or sold.
  protected(
    GumbaSymbol(
      name: 'Protected',
      description:
          'This mushroom is protected by law and cannot be harvested or sold.',
      iconPath: AppImagePaths.protectedIconImage,
    ),
  ),

  /// This mushroom is commonly found in leaf forests.
  growsInLeafForest(
    GumbaSymbol(
      name: 'Grows in leaf forest',
      description: 'This mushroom typically grows in leaf forests.',
      iconPath: AppImagePaths.growsInLeafForestIconImage,
    ),
  ),

  /// This mushroom is commonly found in coniferous forests.
  growsInConiferousForest(
    GumbaSymbol(
      name: 'Grows in coniferous forest',
      description: 'This mushroom typically grows in coniferous forests.',
      iconPath: AppImagePaths.growsInConiferousForestIconImage,
    ),
  ),

  /// This mushroom is commonly found in grasslands.
  growsInGrassLand(
    GumbaSymbol(
      name: 'Grows in grassland',
      description: 'This mushroom typically grows in grasslands.',
      iconPath: AppImagePaths.growsInGrassLandIconImage,
    ),
  ),

  /// This mushroom is commonly found growing on wood.
  growsOnWood(
    GumbaSymbol(
      name: 'Grows on wood',
      description: 'This mushroom typically grows on wood.',
      iconPath: AppImagePaths.growsOnWoodIconImage,
    ),
  ),

  /// This mushroom has healing properties or medicinal uses.
  hasHealingProperties(
    GumbaSymbol(
      name: 'Has healing properties',
      description: 'This mushroom is believed to have medicinal properties.',
      iconPath: AppImagePaths.hasHealingPropertiesIconImage,
    ),
  )
  ;

  /// The constructor for the enum, which takes a GumbaSymbol as an argument.
  const GumbaSymbols(this.value);

  /// This is the symbol which is selected from the enum.
  final GumbaSymbol value;
}

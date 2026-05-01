import 'package:gumba/style.dart';
import 'package:json_annotation/json_annotation.dart';

part 'symbols.g.dart';

@JsonSerializable()
class GumbaSymbol{
  final String name;
  final String description;
  final String iconPath;
  const GumbaSymbol({required this.name, required this.description, required this.iconPath});



  factory GumbaSymbol.fromJson(Map<String, dynamic> json) => 
      _$GumbaSymbolFromJson(json);
  Map<String, dynamic> toJson() => _$GumbaSymbolToJson(this);
}

enum GumbaSymbols{
  edible(GumbaSymbol(name: "Edible", description: "This mushroom is safe to eat.", iconPath: AppImagePaths.edibleIconImage)),
  conditionallyEdible(GumbaSymbol(name: "Conditionally Edible", description: "This mushroom is safe to eat when properly prepared.", iconPath: AppImagePaths.conditionallyEdibleIconImage)),
  notEdible(GumbaSymbol(name: "Not Edible", description: "This mushroom is not safe to eat.", iconPath: AppImagePaths.notEdibleIconImage)),
  poisonous(GumbaSymbol(name: "Poisonous", description: "This mushroom is toxic and can cause illness or death if ingested.", iconPath: AppImagePaths.poisonousIconImage)),
  canBeSoldInHungary(GumbaSymbol(name: "Can be sold in Hungary", description: "This mushroom can be legally sold in Hungary.", iconPath: AppImagePaths.canBeSoldInHungaryIconImage)),
  protected(GumbaSymbol(name: "Protected", description: "This mushroom is protected by law and cannot be harvested or sold.", iconPath: AppImagePaths.protectedIconImage)),
  growsInLeafForest(GumbaSymbol(name: "Grows in leaf forest", description: "This mushroom typically grows in leaf forests.", iconPath: AppImagePaths.growsInLeafForestIconImage)),
  growsInConiferousForest(GumbaSymbol(name: "Grows in coniferous forest", description: "This mushroom typically grows in coniferous forests.", iconPath: AppImagePaths.growsInConiferousForestIconImage)),
  growsInGrassLand(GumbaSymbol(name: "Grows in grassland", description: "This mushroom typically grows in grasslands.", iconPath: AppImagePaths.growsInGrassLandIconImage)),
  growsOnWood(GumbaSymbol(name: "Grows on wood", description: "This mushroom typically grows on wood.", iconPath: AppImagePaths.growsOnWoodIconImage)),
  hasHealingProperties(GumbaSymbol(name: "Has healing properties", description: "This mushroom is believed to have medicinal properties.", iconPath: AppImagePaths.hasHealingPropertiesIconImage));
  
  final GumbaSymbol value;
  const GumbaSymbols(this.value);
}
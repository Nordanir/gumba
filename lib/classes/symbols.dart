import 'package:flutter/material.dart';

class GumbaSymbol{
  final String name;
  final String description;
  final IconData icon;
  const GumbaSymbol({required this.name, required this.description, required this.icon});
}

enum GumbaSymbols{
  edible(GumbaSymbol(name: "Edible", description: "This mushroom is safe to eat.", icon: Icons.check)),
  conditionallyEdible(GumbaSymbol(name: "Conditionally Edible", description: "This mushroom is safe to eat when properly prepared.", icon: Icons.warning)),
  notEdible(GumbaSymbol(name: "Not Edible", description: "This mushroom is not safe to eat.", icon: Icons.close)),
  poisonous(GumbaSymbol(name: "Poisonous", description: "This mushroom is toxic and can cause illness or death if ingested.", icon: Icons.dangerous)),
  canBeSoldInHungary(GumbaSymbol(name: "Can be sold in Hungary", description: "This mushroom can be legally sold in Hungary.", icon: Icons.shopping_cart)),
  protected(GumbaSymbol(name: "Protected", description: "This mushroom is protected by law and cannot be harvested or sold.", icon: Icons.shield)),
  growsInLeafForest(GumbaSymbol(name: "Grows in leaf forest", description: "This mushroom typically grows in leaf forests.", icon: Icons.nature)),
  growsInConiferousForest(GumbaSymbol(name: "Grows in coniferous forest", description: "This mushroom typically grows in coniferous forests.", icon: Icons.forest)),
  growsInGrassLand(GumbaSymbol(name: "Grows in grassland", description: "This mushroom typically grows in grasslands.", icon: Icons.grass)),
  growsOnWood(GumbaSymbol(name: "Grows on wood", description: "This mushroom typically grows on wood.", icon: Icons.account_tree)),
  hasHealingProperties(GumbaSymbol(name: "Has healing properties", description: "This mushroom is believed to have medicinal properties.", icon: Icons.healing));
  
  final GumbaSymbol value;
  const GumbaSymbols(this.value);
}
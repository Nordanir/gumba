import 'package:flutter/material.dart';
import 'package:gumba/classes/symbols.dart';

class Mushroom {
  String? type;
  String id;
  String name;
  String latinName;
  String? cap;
  Image? image;
  String? stem;
  String? gills;
  String flesh;
  String culinaryUse;
  String occurrence;
  String? frutingLayer;
  String? hymenium;
  List<GumbaSymbol> symbols;
  List<int> activeMonths;

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
    this.image,
    this.stem,
    this.gills,
    this.frutingLayer,
    this.hymenium,
  });
}

import 'package:gumba/classes/symbols.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'mushroom.g.dart';

@JsonSerializable()
class Mushroom {
  String? type;
  String id;
  String name;
  String latinName;
  String? cap;
  String? imageUrl; 
  String? stem;
  String? gills;
  String flesh;
  String culinaryUse;
  String occurrence;
  String? frutingLayer;
  String? hymenium;
  List<GumbaSymbol> symbols;
  List<int> activeMonths;
  
  //factory Mushroom.fromJson(Map<String, dynamic> json) => _$MushroomFromJson(json);
  //Map<String, dynamic> toJson() => _$MushroomToJson(this);

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
}

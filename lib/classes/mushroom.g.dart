// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mushroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mushroom _$MushroomFromJson(Map<String, dynamic> json) => Mushroom(
  id: json['id'] as String,
  name: json['name'] as String,
  latinName: json['latinName'] as String,
  flesh: json['flesh'] as String,
  culinaryUse: json['culinaryUse'] as String,
  activeMonths: (json['activeMonths'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  symbols: (json['symbols'] as List<dynamic>)
      .map((e) => GumbaSymbol.fromJson(e as Map<String, dynamic>))
      .toList(),
  occurrence: json['occurrence'] as String,
  type: json['type'] as String?,
  cap: json['cap'] as String?,
  imageUrl: json['imageUrl'] as String?,
  stem: json['stem'] as String?,
  gills: json['gills'] as String?,
  frutingLayer: json['frutingLayer'] as String?,
  hymenium: json['hymenium'] as String?,
);

Map<String, dynamic> _$MushroomToJson(Mushroom instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'latinName': instance.latinName,
  'cap': instance.cap,
  'imageUrl': instance.imageUrl,
  'stem': instance.stem,
  'gills': instance.gills,
  'flesh': instance.flesh,
  'culinaryUse': instance.culinaryUse,
  'occurrence': instance.occurrence,
  'frutingLayer': instance.frutingLayer,
  'hymenium': instance.hymenium,
  'symbols': instance.symbols.map((s) => s.toJson()).toList(),
  'activeMonths': instance.activeMonths,
};

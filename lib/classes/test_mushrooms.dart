 import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/classes/symbols.dart';

List<Mushroom> testMushrooms = [
     Mushroom(
    id: '1',
    flesh: 'This is a test mushroom.',
    culinaryUse: 'Edible',
    name: 'Test Mushroom',
    latinName: 'Testus mushroomus',
    occurrence: 'Common',
    activeMonths: [5,6,7,8,9,10],
    symbols: [GumbaSymbols.edible.value, GumbaSymbols.growsInGrassLand.value ],
    type : "disc"
  ),
    Mushroom(
    id: '1',
    flesh: 'This is a test mushroom.',
    culinaryUse: 'Edible',
    name: 'Test Mushroom',
    latinName: 'Testus mushroomus',
    occurrence: 'Common',
    activeMonths: [1,8,9,10],
    symbols: [GumbaSymbols.edible.value, GumbaSymbols.growsInGrassLand.value ],
    type : "neither"
  ),
    Mushroom(
    id: '1',
    flesh: 'This is a test mushroom.',
    culinaryUse: 'Edible',
    name: 'Test Mushroom 2',
    latinName: 'Testus mushroomus',
    occurrence: 'Common',
    activeMonths: [1,8,9,10],
    symbols: [GumbaSymbols.edible.value, GumbaSymbols.growsInGrassLand.value ],
    type : "pipe"
  ),
    Mushroom(
    id: '1',
    flesh: 'This is a test mushroom.',
    culinaryUse: 'Edible',
    name: 'Test Mushroom 3',
    latinName: 'Testus mushroomus',
    occurrence: 'Common',
    activeMonths: [1,8,9,10],
    symbols: [GumbaSymbols.edible.value, GumbaSymbols.growsInGrassLand.value ]
  )
];
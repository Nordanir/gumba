import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widgets/gumba_card.dart';

/// This widgets displays a list of mushrooms as a grid of cards.
class GumbaList extends StatelessWidget {
  /// ANY list of mushrooms can be passed to display.
  const GumbaList({required this.mushrooms, super.key});

  ///Mushroom data as a list
  final List<Mushroom> mushrooms;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return SizedBox(
      height: appSize.height * .6,

      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: mushrooms.length,
        itemBuilder: (context, index) =>
            RepaintBoundary(child: GumbaListCard(mushroom: mushrooms[index])),
      ),
    );
  }
}

/// A card widget used by GumbaList to display mushroom data.
class GumbaListCard extends StatelessWidget {
  ///
  const GumbaListCard({required this.mushroom, super.key});

  ///
  final Mushroom mushroom;

  Color get _cardColor {
    switch (mushroom.type?.toLowerCase()) {
      case 'neither':
        return gradiant;
      case 'pipe':
        return lightRed;
      case 'disc':
        return lightBlue;
      default:
        return baseGreen; // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (_) => GumbaCard(mushroom: mushroom)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: _cardColor,
          border: Border.all(color: black),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                child: mushroom.imageUrl != null
                    ? Image.asset(mushroom.imageUrl!)
                    : Image.asset('assets/test.jpg', fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.small,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppSpacing.small,
                  children: [
                    Flexible(
                      child: Text(
                        mushroom.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: fairyGumba.textTheme.labelMedium,
                      ),
                    ),
                    Flexible(
                      child: DisplaySymbols(
                        symbols: mushroom.symbols,
                        isVertical: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

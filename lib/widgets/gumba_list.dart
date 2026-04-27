import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/style.dart';
import 'package:gumba/widgets/gumba_card.dart';

class GumbaList extends StatelessWidget {
  const GumbaList({super.key, required this.mushrooms});
  final List<Mushroom> mushrooms;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(AppSpacing.large),
      height: appSize.height * .8,

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

class GumbaListCard extends StatelessWidget {
  const GumbaListCard({super.key, required this.mushroom});
  final Mushroom mushroom;

  Color get _cardColor {
    switch (mushroom.type?.toLowerCase()) {
      case 'neither': return gradiant;
      case 'pipe':    return lightRed;
      case 'disc':    return lightBlue;
      default:        return baseGreen; // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => GumbaCard(mushroom: mushroom)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: _cardColor,
          border: Border.all(color: black),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                child: mushroom.imageUrl !=null ?  Image.asset(mushroom.imageUrl!) :
                     Image.asset('assets/test.jpg', fit: BoxFit.cover),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.small),
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
import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/classes/symbols.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';

class GumbaCard extends StatelessWidget {
  const GumbaCard({super.key, required this.mushroom});
  final Mushroom mushroom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: gumbaCardPadding,
      decoration: BoxDecoration(color: theme.colorScheme.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.small,
        children: [
          Column(
            children: [
              GumbaCardTopBar(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.asset('assets/test.jpg'),
              ),
              ActiveMonthsBar(activeMonths: mushroom.activeMonths),
            ],
          ),

          Text(mushroom.name, style: theme.textTheme.bodyLarge),
          Text(mushroom.latinName, style: theme.textTheme.titleSmall),
          SizedBox(
            width: appWidth - 2 * AppSpacing.medium,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 7, child: Details(mushroom)),
                Expanded(
                  flex: 3,
                  child: SymbolColumn(symbols: mushroom.symbols),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveMonthsBar extends StatelessWidget {
  const ActiveMonthsBar({super.key, required this.activeMonths});
  final List<int> activeMonths;

  List<Color> setColorsForActiveMonths(List<int> activeMonths) {
    final baseColorList = List<Color>.filled(12, baseGreen);

    for (int month in activeMonths) {
      if (month == 1 && !activeMonths.contains(12)) {
        baseColorList[11] = gradiant;
        baseColorList[month - 1] = active;
      }
      if (month == 12 && !activeMonths.contains(1)) {
        baseColorList[0] = gradiant;
        baseColorList[month - 1] = active;
      } else {
        if (!activeMonths.contains(month - 1) && month != 1) {
          baseColorList[month - 2] = gradiant;
        }
        if (!activeMonths.contains(month + 1) && month != 12) {
          baseColorList[month] = gradiant;
        }

        logger.i('Setting $month to active');
        baseColorList[month - 1] = active;
      }
    }
    return baseColorList;
  }

  @override
  Widget build(BuildContext context) {
    final appwidth = MediaQuery.sizeOf(context).width;
    final monthColors = setColorsForActiveMonths(activeMonths);
    final activeMonthsSectionWidth = (appwidth -
                  AppSpacing.medium * 2 -
                  AppBorders.largeBorderSize * 2) /
              12;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: AppBorders.largeBorderSize,
        ),
      ),
      height: AppDimensions.activeMonthsBarHeight(
        MediaQuery.sizeOf(context).height,
      ),

      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width:
              activeMonthsSectionWidth,
          decoration: BoxDecoration(
            color: monthColors[index],
            border: Border.all(
              color: Colors.black,
              width: AppBorders.thinBordersize,
            ),
          ),
        ),
        itemCount: 12,
      ),
    );
  }
}

class SymbolColumn extends StatelessWidget {
  const SymbolColumn({super.key, required this.symbols});
  final List<GumbaSymbol> symbols;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.large,
      children: [
        for (GumbaSymbol symbol in symbols) SymbolCard(symbol: symbol),
      ],
    );
  }
}

class SymbolCard extends StatelessWidget {
  const SymbolCard({super.key, required this.symbol});
  final GumbaSymbol symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.CircularButtonSize,
      decoration: BoxDecoration(
        border: Border.all(color: baseGreen),
        borderRadius: BorderRadius.all(Radius.circular(AppBorderRadius.small)),
      ),
      child: Icon(symbol.icon ,),
    );
  }
}

class Details extends StatelessWidget {
  const Details(this.mushroom, {super.key});
  final Mushroom mushroom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(label: "Flesh: ", text: mushroom.flesh),
        LabelText(label: "Culinary use: ", text: mushroom.culinaryUse),
        LabelText(label: "Occurrence: ", text: mushroom.occurrence),
        if (mushroom.cap != null)
          LabelText(label: "Cap: ", text: mushroom.cap!),
        if (mushroom.stem != null)
          LabelText(label: "Stem: ", text: mushroom.stem!),
        if (mushroom.gills != null)
          LabelText(label: "Gills: ", text: mushroom.gills!),
        if (mushroom.frutingLayer != null)
          LabelText(label: "Fruiting Layer: ", text: mushroom.frutingLayer!),
        if (mushroom.hymenium != null)
          LabelText(label: "Hymenium: ", text: mushroom.hymenium!),
      ],
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label, required this.text});

  final String label;
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(label, style: textTheme.labelMedium),
        Text(text, style: textTheme.bodyMedium),
      ],
    );
  }
}

class GumbaCardTopBar extends StatelessWidget {
  const GumbaCardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        
        border: Border.all(color: black),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.small),
          topRight: Radius.circular(AppBorderRadius.small),
        ),
      ),
      child: Row(
        children: [
          GumbaCardTopBarButton(
            onpressed: () => (logger.i('I have to be implemented')),
            icon: Icons.back_hand,
          ),
          Spacer(),
          GumbaCardTopBarButton(
            onpressed: () => (logger.i('I have to be implemented')),
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}

class GumbaCardTopBarButton extends StatelessWidget {
  const GumbaCardTopBarButton({
    super.key,
    required this.onpressed,
    required this.icon,
  });
  final VoidCallback onpressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.CircularButtonSize,
      height: AppDimensions.CircularButtonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
        border: Border.all(color: black)
      ),
      child: IconButton(onPressed: onpressed, padding: EdgeInsets.zero, icon: Icon(icon, size: AppDimensions.iconSize)),
    );
  }
}

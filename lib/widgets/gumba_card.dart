import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/classes/symbols.dart';
import 'package:gumba/data_controller.dart';
import 'package:gumba/style.dart';
import 'package:provider/provider.dart';

/// This card is displaying detailed informations about mushrooms.
/// This card is painted when a children in the GumbaList is tapped.
class GumbaCard extends StatelessWidget {
  ///
  const GumbaCard({required this.mushroom, super.key});

  /// The mushroom which's data is dispayed
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
              GumbaCardTopBar(
                mushroom: mushroom,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: black),
                ),
                child: Image.asset(AppImagePaths.defaulMushroomImage),
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
                  child: DisplaySymbols(
                    symbols: mushroom.symbols,
                    isVertical: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom bar to display the occurence of the mushroom throught the year.
/// The widget calculates the color of the transitional and active months.
class ActiveMonthsBar extends StatelessWidget {
  ///
  const ActiveMonthsBar({required this.activeMonths, super.key});

  /// Active months are stored in a mushrooms.activeMonths field.
  final List<int> activeMonths;

  /// Returs the colors of the month representing brick
  ///  based on the mushrooms activity
  List<Color> setColorsForActiveMonths(List<int> activeMonths) {
    final baseColorList = List<Color>.filled(12, baseGreen);

    for (final month in activeMonths) {
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

        baseColorList[month - 1] = active;
      }
    }
    return baseColorList;
  }

  @override
  Widget build(BuildContext context) {
    final appwidth = MediaQuery.sizeOf(context).width;
    final monthColors = setColorsForActiveMonths(activeMonths);
    final activeMonthsSectionWidth =
        (appwidth - AppSpacing.medium * 2 - AppBorders.largeBorderSize * 2) /
        12;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: black,
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
          width: activeMonthsSectionWidth,
          decoration: BoxDecoration(
            color: monthColors[index],
            border: Border.all(),
          ),
        ),
        itemCount: 12,
      ),
    );
  }
}

/// Displays the symbols associated with the provided mushroom.
class DisplaySymbols extends StatelessWidget {
  ///
  const DisplaySymbols({
    required this.symbols, required this.isVertical, super.key,
  });

  ///
  final List<GumbaSymbol> symbols;

  /// Wheather are the symbols should be painted vertically (true)
  /// or horizontaly.
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            spacing: AppSpacing.large,
            children: [
              for (final GumbaSymbol symbol in symbols)
                SymbolCard(symbol: symbol),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.large,
            children: [
              for (final GumbaSymbol symbol in symbols)
                SymbolCard(symbol: symbol),
            ],
          );
  }
}

/// Card to display the symbol
class SymbolCard extends StatelessWidget {
  ///
  const SymbolCard({required this.symbol, super.key});

  ///
  final GumbaSymbol symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.circularButtonSize,
      decoration: BoxDecoration(
        border: Border.all(color: black),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppBorderRadius.small),
        ),
      ),
      child: Image.asset(symbol.iconPath),
    );
  }
}

/// Displays the details of the mushroom 
/// on the mushroom's provided fields of information.
class Details extends StatelessWidget {
  ///
  const Details(this.mushroom, {super.key});
  ///
  final Mushroom mushroom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelWithText(label: 'Flesh: ', text: mushroom.flesh),
        LabelWithText(label: 'Culinary use: ', text: mushroom.culinaryUse),
        LabelWithText(label: 'Occurrence: ', text: mushroom.occurrence),
        if (mushroom.cap != null)
          LabelWithText(label: 'Cap: ', text: mushroom.cap!),
        if (mushroom.stem != null)
          LabelWithText(label: 'Stem: ', text: mushroom.stem!),
        if (mushroom.gills != null)
          LabelWithText(label: 'Gills: ', text: mushroom.gills!),
        if (mushroom.frutingLayer != null)
          LabelWithText(
            label: 'Fruiting Layer: ',
            text: mushroom.frutingLayer!,
          ),
        if (mushroom.hymenium != null)
          LabelWithText(label: 'Hymenium: ', text: mushroom.hymenium!),
      ],
    );
  }
}
/// Helper widget to display information with a label with different styling.
/// (in a row)
class LabelWithText extends StatelessWidget {
  ///
  const LabelWithText({required this.label, required this.text, super.key});
///
  final String label;
  ///
  final String text;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: label, style: textTheme.labelMedium),
            TextSpan(text: text, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
/// The display cards top bar with save and return buttons.
class GumbaCardTopBar extends StatelessWidget {
  ///
  const GumbaCardTopBar({required this.mushroom, super.key});
  ///
  final Mushroom mushroom;
  @override
  Widget build(BuildContext context) {
    final dataController = DataController();
    final savedMushrooms = Provider.of<SavedMushrooms>(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        border: Border.all(color: black),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.small),
          topRight: Radius.circular(AppBorderRadius.small),
        ),
      ),
      child: Row(
        children: [
          GumbaCardTopBarButton(
            onpressed: () => {Navigator.pop(context)},
            icon: Icons.back_hand,
          ),
          const Spacer(),
          GumbaCardTopBarButton(
            onpressed: () =>
                dataController.saveMushroom(mushroom, savedMushrooms),
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}
/// Abstraction of the buttons on the cards top bar
class GumbaCardTopBarButton extends StatelessWidget {
  /// Requires the icon of the button and the functionallity when tapped.
  const GumbaCardTopBarButton({
    required this.onpressed, required this.icon, super.key,
  });
  ///
  final VoidCallback onpressed;
  ///
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.circularButtonSize,
      height: AppDimensions.circularButtonSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: black),
      ),
      child: IconButton(
        onPressed: onpressed,
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: AppDimensions.iconSize),
      ),
    );
  }
}

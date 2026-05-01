import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/display_controller.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';
import 'package:provider/provider.dart';

class GumbaAppBar extends StatelessWidget  {
  const GumbaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  AppDimensions.appBarHeight(MediaQuery.sizeOf(context).height),
      margin: EdgeInsets.only(top: AppSpacing.xl ,bottom: AppBorderRadius.large),
      child: const Row(
        spacing: AppSpacing.large,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoToLexiconButton(),
          GumbaButton(),
          SavedGumbasButton(),
        ],
      ),
    );
  }
}

class GoToLexiconButton extends StatelessWidget {
  const GoToLexiconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      imageURL: AppImagePaths.databaseIconImage,
      onPressed: () => onEncyclopediaButtonPressed(context),
    );
  }
}



class GumbaButton extends StatelessWidget {
  const GumbaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarButton(
      imageURL: "assets/gumba_log.png",
      onPressed: onSettingsButtonPressed,
    );
  }
}

class SavedGumbasButton extends StatelessWidget {
  const SavedGumbasButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBarButton(
      imageURL: AppImagePaths.savedGumbasIconImage,
      onPressed: () => onSavedGumbasButtonPressed(context),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      imageURL: "assets/gumba_log.png",
      onPressed: onSettingsButtonPressed,
    );
  }
}

class AppBarButton extends StatelessWidget {
  final String imageURL;
  final VoidCallback onPressed;
  const AppBarButton({super.key, required this.imageURL, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => (onPressed()),
      child: Container(
        decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppBorderRadius.small)),
          color: colors.onSecondary.withValues(alpha: .5)
        ),
        
        child: Image.asset(imageURL),
      ),
    );
  }
}

void onSettingsButtonPressed() {
  logger.d('Settings button pressed');
}

void onEncyclopediaButtonPressed(BuildContext context) {
  logger.d('Encyclopedia button pressed');
  Provider.of<DisplayController>(context, listen: false).setDisplayedMushrooms = Provider.of<MushroomEncyclopedia>(context, listen: false).mushrooms;
}

void onSavedGumbasButtonPressed(BuildContext context) {
  logger.d('Saved Gumbas button pressed');
  Provider.of<DisplayController>(context, listen: false).setDisplayedMushrooms = Provider.of<SavedMushrooms>(context, listen: false).mushrooms;
}
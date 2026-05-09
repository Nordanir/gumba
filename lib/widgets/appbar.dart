import 'package:flutter/material.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/display_controller.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';
import 'package:provider/provider.dart';

/// Custom app bar for the application
/// Contains buttons for encyclopedia, saved gumbas,
/// and a main button that can be set to different functions.
class GumbaAppBar extends StatelessWidget {
  ///
  const GumbaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.appBarHeight(MediaQuery.sizeOf(context).height),
      margin: const EdgeInsets.only(
        top: AppSpacing.xl,
        bottom: AppBorderRadius.large,
      ),
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
/// Lexicon button if tapped it will set the displayed to all mushhrooms.
class GoToLexiconButton extends StatelessWidget {
  ///
  const GoToLexiconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      imageURL: AppImagePaths.databaseIconImage,
      onPressed: () => onEncyclopediaButtonPressed(context),
    );
  }
}
/// Main button in the appbar, currently set to just log a message when tapped,
/// but will be modifieable to perform any desired action.
class GumbaButton extends StatelessWidget {
  ///
  const GumbaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      imageURL: AppImagePaths.gumbaIconImage,
      onPressed: () => logger.d('Gumba button pressed'),
    );
  }
}
/// Sets the display to the mushrooms that are saved to user's profile.
class SavedGumbasButton extends StatelessWidget {
  ///
  const SavedGumbasButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      imageURL: AppImagePaths.savedGumbasIconImage,
      onPressed: () => onSavedGumbasButtonPressed(context),
    );
  }
}

/// This is the abstraction for the appbar buttons
/// it takes an image and a function to execute when tapped.
class AppBarButton extends StatelessWidget {
  ///
  const AppBarButton({
    required this.imageURL, required this.onPressed, super.key,
  });
  /// The icon image path for the button.
  final String imageURL;
  /// The function to execute when the button is tapped.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppBorderRadius.small),
          ),
          color: colors.onSecondary.withValues(alpha: .5),
        ),

        child: Image.asset(imageURL),
      ),
    );
  }
}


/// Sets the display controllers mushroom list to the general database.
void onEncyclopediaButtonPressed(BuildContext context) {
  logger.d('Encyclopedia button pressed');
  Provider.of<DisplayController>(context, listen: false).displayedMushrooms =
      Provider.of<MushroomEncyclopedia>(context, listen: false).mushrooms;
}
/// Sets the display controllers mushroom list to the profile's saved mushrooms.
void onSavedGumbasButtonPressed(BuildContext context) {
  logger.d('Saved Gumbas button pressed');
  Provider.of<DisplayController>(context, listen: false).displayedMushrooms =
      Provider.of<SavedMushrooms>(context, listen: false).mushrooms;
}

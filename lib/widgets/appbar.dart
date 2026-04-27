import 'package:flutter/material.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';

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
    return const AppBarButton(
      imageURL: AppImagePaths.databaseIconImage,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class AddFromDataBaseButton extends StatelessWidget {
  const AddFromDataBaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarButton(
      imageURL: AppImagePaths.gumbaIconImage,
      onPressed: onSettingsButtonPressed,
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
    return const AppBarButton(
      imageURL: AppImagePaths.savedGumbasIconImage,
      onPressed: onSettingsButtonPressed,
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
      onTap: () => (onSettingsButtonPressed()),
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

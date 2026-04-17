import 'package:flutter/material.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';

class GumbaAppBar extends StatelessWidget  {
  const GumbaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.appBarHeight(MediaQuery.sizeOf(context).height),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      margin: EdgeInsets.only(top: AppSpacing.large ,bottom: AppBorderRadius.large),
      child: Row(
        spacing: AppSpacing.large,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoToLexiconButton(),
          AddFromDataBaseButton(),
          GumbaButton(),
          SavedGumbasButton(),
          SettingsButton(),
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
      icon: Icons.book,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class AddFromDataBaseButton extends StatelessWidget {
  const AddFromDataBaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarButton(
      icon: Icons.add,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class GumbaButton extends StatelessWidget {
  const GumbaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarButton(
      icon: Icons.yard,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class SavedGumbasButton extends StatelessWidget {
  const SavedGumbasButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarButton(
      icon: Icons.save,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarButton(
      icon: Icons.settings,
      onPressed: onSettingsButtonPressed,
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AppBarButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.onSecondary.withValues(alpha: .5)
      ),
      
      child: IconButton(color: colors.onSurface, onPressed: onPressed, icon: Icon(icon,size: 16,)),
    );
  }
}

void onSettingsButtonPressed() {
  logger.d('Settings button pressed');
}

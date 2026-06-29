import 'package:flutter/material.dart';
import 'package:gumba/style.dart';


/// Widget that has the database actions like sorting and adding new entries.
class ActionBar extends StatelessWidget {
  ///
  const ActionBar({super.key});


/// Widget that has the database actions like sorting and adding new entries.  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.appBarHeight(MediaQuery.of(context).size.height),
      width: AppDimensions.defaulDeviceWidth,
      decoration: BoxDecoration(
        border:Border.all(
          color: baseGreen,
        ),
        color: gradiant,
        borderRadius: BorderRadius.circular(AppBorderRadius.medium),
      ),
      padding: const EdgeInsets.all(AppSpacing.small),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionBarButton(
          ),
          GumbaSearchBar(),
          ActionBarButton(
          ), 
        ],
      ),
    );
  }

}
/// Widget that represents a button in the action bar.
class ActionBarButton extends StatelessWidget {
  ///
  const ActionBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        
      },
    );
  }
}
/// Custom SearBar widget.
class GumbaSearchBar extends StatelessWidget {
  ///
  const GumbaSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          type: MaterialType.transparency,
          child: TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: 'Search...',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white.withAlpha( 200),
            ),
            onChanged: (value) {
              // Handle search logic here
            },
          ),
        ),
      );
  }
}

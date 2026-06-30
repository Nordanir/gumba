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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AddMushroomButton(),
          const FilterButton(),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 2* AppSpacing.large) * 0.5,
            child: const GumbaSearchBar()),
          const SortingButton(),
          const ChangeSortOrder()
        ],
      ),
    );
  }

}
/// Widget that represents a button in the action bar.
class ActionBarButton extends StatelessWidget {
  ///
  const ActionBarButton({required this.imagePath, required this.function,  super.key});
  ///
  final String imagePath;
  /// Behavior when pressed
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Image.asset(imagePath),
    );
  }
}
/// Custom SearBar widget.
class GumbaSearchBar extends StatelessWidget {
  ///
  const GumbaSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
          ),
          filled: true,
          fillColor: Colors.white.withAlpha( 200),
        ),
        onChanged: (value) {
          // Handle search logic here
        },
      ),
    );
  }
}
/// Widget that shows the add musuhroom dialog panel.
class AddMushroomButton extends StatelessWidget {
  ///
  const AddMushroomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionBarButton(
      imagePath: AppImagePaths.addMushroomIcon,
      function: () {},
    );
  }
}
/// Sorting button with a dropdown menu and ordering options.

class FilterButton extends StatelessWidget {
  ///
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionBarButton(imagePath: AppImagePaths.filderIcon, function: () {});
  }
}
/// Button that reveals sorting panel
class SortingButton extends StatelessWidget {
  ///
  const SortingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionBarButton(imagePath: AppImagePaths.sortIcon, function: () {} );
  }
}
/// Button to change sorting order
class ChangeSortOrder extends StatefulWidget {
  ///
  const ChangeSortOrder({super.key});

  @override
  State<ChangeSortOrder> createState() => ChangeSortOrderState();
}
///
class ChangeSortOrderState extends State<ChangeSortOrder> {
  /// Variable to store the current order direction.
  
  
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_)  {
      // Preload both images into the cache so they switch instantly without flashing
      precacheImage(const AssetImage(AppImagePaths.sortOrderUpIcon), context);
      precacheImage(const AssetImage(AppImagePaths.sortOrderDownIcon), context);
    });
  }
  ///
  bool isOrderUp = true;
  /// Function to toggle the order direction.

  void changeSortOrder() {
    setState(() {
      isOrderUp = !isOrderUp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ActionBarButton(imagePath: isOrderUp ? AppImagePaths.sortOrderUpIcon : AppImagePaths.sortOrderDownIcon, function: changeSortOrder);
  }
}

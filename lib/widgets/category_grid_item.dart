import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

/// A grid item widget that displays a [Category] with a gradient background and styled title.
///
/// Used in category overview screens. Tapping the item can be handled via the [onTap] callback.
// Constants for styling
const double _kBorderRadius = 16.0;
const double _kPadding = 16.0;
const double _kGradientStartOpacity = 0.55;
const double _kGradientEndOpacity = 0.9;

class CategoryGridItem extends StatelessWidget {
  /// Creates a [CategoryGridItem] for the given [category].
  ///
  /// The [category.title] must not be null or empty.
  CategoryGridItem({super.key, required this.category, required this.onSelectCategory})
    : assert(category.title != '', 'Category title must not be null or empty.');

  final Category category;
  final void Function()? onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(_kBorderRadius),
      child: Container(
        padding: const EdgeInsets.all(_kPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_kBorderRadius),
          gradient: LinearGradient(
            colors: [
              // Cannot be const because category.color is dynamic
              category.color.withValues(alpha: _kGradientStartOpacity),
              category.color.withValues(alpha: _kGradientEndOpacity),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

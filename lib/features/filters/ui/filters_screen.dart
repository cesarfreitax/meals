import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/features/filters/data/enum_filters.dart';
import 'package:meals/features/filters/ui/widgets/filter_switch_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            FilterSwitchItem(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              filter: Filter.glutenFree,
            ),
            FilterSwitchItem(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              filter: Filter.lactoseFree,
            ),
            FilterSwitchItem(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              filter: Filter.vegetarian,
            ),
            FilterSwitchItem(
              title: 'Vegan',
              subtitle: 'Only include gluten-free meals',
              filter: Filter.vegan,
            ),
          ],
        ),
      ),
    );
  }
}

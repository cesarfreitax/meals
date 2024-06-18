import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/features/filters/data/enum_filters.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterSwitchItem extends ConsumerWidget {
  const FilterSwitchItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.filter,
  });

  final String title;
  final String subtitle;
  final Filter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return SwitchListTile(
      value: activeFilters[filter] ?? false,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}

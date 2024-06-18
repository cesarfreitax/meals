import 'package:flutter/material.dart';
import 'package:meals/features/tabs/ui/widgets/main_drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.navigate});

  final void Function(String identifier) navigate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.6),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.fastfood,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
              const SizedBox(width: 16),
              Text(
                'Cooking Up!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
        ),
        MainDrawerItem(
          icon: Icons.restaurant,
          label: 'Meals',
          onTap: () {
            navigate('meals');
          },
        ),
        MainDrawerItem(
          icon: Icons.settings,
          label: 'Filters',
          onTap: () {
            navigate('filters');
          },
        )
      ]),
    );
  }
}

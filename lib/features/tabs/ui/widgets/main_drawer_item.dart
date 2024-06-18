import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({super.key, required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        size: 24,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 20
        ),
      ),
      onTap: onTap,
    );
  }

}
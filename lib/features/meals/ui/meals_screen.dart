import 'package:flutter/material.dart';
import 'package:meals/features/meals/data/model/meal.dart';
import 'package:meals/features/meals/ui/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... nothing here!",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            Text(
              "Try selecting a different category.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            )
          ],
        ),
      );
    } else {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meal: meals[index]);

          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: content,
    );
  }
}

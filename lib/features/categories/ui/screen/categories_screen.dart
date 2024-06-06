import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/features/categories/data/model/category.dart';
import 'package:meals/features/categories/ui/widgets/category_grid_item.dart';
import 'package:meals/features/meals/data/model/meal.dart';
import 'package:meals/features/meals/ui/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void selectCategory(BuildContext context, Category category) {
      List<Meal> filteredMeals = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5),
        children: [
          ...availableCategories.map((category) => CategoryGridItem(
                category: category,
                onSelectedCategory: () {
                  selectCategory(context, category
                  );
                },
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/features/categories/data/model/category.dart';
import 'package:meals/features/categories/ui/widgets/category_grid_item.dart';
import 'package:meals/features/meals/data/model/meal.dart';
import 'package:meals/features/meals/ui/meals_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<StatefulWidget> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.stop();
  }

  @override
  Widget build(BuildContext context) {
    void selectCategory(BuildContext context, Category category) {
      List<Meal> filteredMeals = widget.availableMeals
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

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(
          top: 100 - animationController.value * 100,
        ),
        child: child,
      ),
      child: GridView(
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
                  selectCategory(context, category);
                },
              ))
        ],
      ),
    );
  }
}

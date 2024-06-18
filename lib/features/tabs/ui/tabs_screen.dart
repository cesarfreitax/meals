import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/features/categories/ui/screen/categories_screen.dart';
import 'package:meals/features/filters/data/enum_filters.dart';
import 'package:meals/features/filters/ui/filters_screen.dart';
import 'package:meals/features/meals/data/model/meal.dart';
import 'package:meals/features/meals/ui/meals_screen.dart';
import 'package:meals/features/tabs/ui/widgets/main_drawer.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<ConsumerStatefulWidget> {
  List<Meal> availableMeals = [];
  Map<Filter, bool> selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void selectNewPageIndex(int index) {
    setState(() {
      currentSelectedPageIndex = index;
      getScreenTitle(index);
    });
  }

  void setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );

      // setState(() {
      //   selectedFilters = result ?? selectedFilters;
      // });
    } else {
      Navigator.of(context).pop();
    }
  }

  void getScreenTitle(int index) {
    screenTitle = index == 0 ? 'Categories' : 'Favorites';
  }

  String screenTitle = "Categories";

  Widget get content {
    if (currentSelectedPageIndex == 0) {
      return CategoriesScreen(
        availableMeals: availableMeals,
      );
    } else {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      return MealsScreen(
        meals: favoriteMeals,
      );
    }
  }

  int currentSelectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableMeals = ref.watch(filteredMealsProvider);

    return Scaffold(
      drawer: MainDrawer(
        navigate: setScreen,
      ),
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectNewPageIndex(index);
        },
        currentIndex: currentSelectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;

  @override
  void initState() {// chưa dùng đc context
    super.initState();
  }

  @override
  void didChangeDependencies() { // chỉ chạy khi init data và khi data change ?, ko chạy vào khi quay về từ pop. Dùng đc context
      final routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeal!.removeWhere((meal) => mealId == meal.id);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeal![index].id,
            title: displayedMeal![index].title,
            imageUrl: displayedMeal![index].imageUrl,
            duration: displayedMeal![index].duration,
            complexity: displayedMeal![index].complexity,
            affordability: displayedMeal![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal!.length,
      ),
    );
  }
}

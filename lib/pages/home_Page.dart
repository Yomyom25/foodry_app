import 'package:flutter/material.dart';
import 'package:foodry_app/components/my_description_box.dart';
import 'package:foodry_app/components/my_current_location.dart';
import 'package:foodry_app/components/my_drawer.dart';
import 'package:foodry_app/components/my_food_tile.dart';
import 'package:foodry_app/components/my_sliver_app_bar.dart';
import 'package:foodry_app/components/my_tab_bar.dart';
import 'package:foodry_app/models/food.dart';
import 'package:foodry_app/models/restaurant.dart';
import 'package:foodry_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // Tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Lista de items por categoría
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Retorna widgets de las categorías
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {

      // Obtiene la categoria del menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //obtiene individual
          final food = categoryMenu[index];

          //retorna el food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food)
                ),
              ),
            );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController), // Usa _tabController
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // Ubicación actual
                const MyCurrentLocation(),

                // Descripción
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => Container(
            color: Theme.of(context).colorScheme.secondary,
            child: TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
        ),
      ),
    );
  }
}

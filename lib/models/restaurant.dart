import 'food.dart';

class Restaurant {
  // Lista del menú
  final List<Food> menu = [
    // Burgers
    Food(
      name: "Classic Burger",
      description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "lib/images/burgers/cheese_burger.png",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Extra Bacon", price: 1.99),
        Addon(name: "Extra Avocado", price: 2.99),
      ],
    ),
    Food(
  name: "BBQ Bacon Burger",
  description: "Beef patty smothered in BBQ sauce, crispy bacon, cheddar cheese, and crunchy onion rings.",
  imagePath: "lib/images/burgers/bbq_bacon_burger.png",
  price: 1.49,
  category: FoodCategory.burgers,
  availableAddons: [
    Addon(name: "Double patty", price: 2.49),
    Addon(name: "Extra BBQ sauce", price: 0.49),
  ],
),
    Food(
      name: "Mushroom Swiss Burger",
      description: "Savory mushrooms sautéed in garlic butter, Swiss cheese, and a perfectly grilled beef patty.",
      imagePath: "lib/images/burgers/mushroom_swiss_burger.png",
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra mushrooms", price: 0.99),
        Addon(name: "Garlic aioli", price: 0.75),
      ],
    ),
    Food(
  name: "Spicy Jalapeño Burger",
  description: "Zesty jalapeños, spicy pepper jack cheese, and a chipotle mayo sauce on a beef patty.",
  imagePath: "lib/images/burgers/spicy_jalapeno_burger.png",
  price: 1.79,
  category: FoodCategory.burgers,
  availableAddons: [
    Addon(name: "Extra jalapeños", price: 0.50),
    Addon(name: "Chipotle mayo", price: 0.75),
    Addon(name: "Grilled onions", price: 0.99),
  ],
),

    // Oriental
    Food(
      name: "Sushi Roll",
      description: "Fresh salmon, avocado, and cucumber wrapped in sushi rice and seaweed",
      imagePath: "lib/images/oriental/sushi_roll.png",
      price: 8.99,
      category: FoodCategory.oriental,
      availableAddons: [
        Addon(name: "Extra Wasabi", price: 0.49),
        Addon(name: "Extra Soy Sauce", price: 0.29),
      ],
    ),
    Food(
      name: "Pad Thai",
      description: "Stir-fried rice noodles with shrimp, egg, and a tangy tamarind sauce",
      imagePath: "lib/images/oriental/pad_thai.png",
      price: 12.99,
      category: FoodCategory.oriental,
      availableAddons: [
        Addon(name: "Extra Shrimp", price: 3.99),
        Addon(name: "Extra Peanuts", price: 0.99),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries with a sprinkle of salt",
      imagePath: "lib/images/sides/french_fries.png",
      price: 2.99,
      category: FoodCategory.slides,
      availableAddons: [
        Addon(name: "Extra Salt", price: 0.10),
        Addon(name: "Cheese Sauce", price: 0.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crispy, golden-battered onion rings",
      imagePath: "lib/images/sides/onion_rings.png",
      price: 3.49,
      category: FoodCategory.slides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.99),
        Addon(name: "BBQ Sauce", price: 0.99),
      ],
    ),

    // Drinks
    Food(
      name: "Classic Cola",
      description: "Refreshing cola served chilled",
      imagePath: "lib/images/drinks/cola.png",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.10),
        Addon(name: "Lemon Slice", price: 0.49),
      ],
    ),
    Food(
      name: "Fresh Lemonade",
      description: "Homemade lemonade with a tangy twist",
      imagePath: "lib/images/drinks/lemonade.png",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Extra Lemon", price: 0.29),
      ],
    ),
  ];

  // GETTERS

  List<Food> get menu => _menu;
}

  // FUNCIONES
  //añadir al carrito
  //Quitar del carrito
  //Obtener el precio
  //numero de items
  //limpiar carrito

  // AYUDAS
  //generar recibo
  
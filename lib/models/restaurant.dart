import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foodry_app/models/cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // Lista del menú
  final List<Food> _menu = [
    // Lista de comida (idéntica a tu versión original)
  ];

  // Carrito de compras
  final List<CartItem> _cart = [];

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // Agregar al carrito
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // Eliminar del carrito
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Obtener el precio total del carrito
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Obtener el número total de items en el carrito
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // Limpiar carrito
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}

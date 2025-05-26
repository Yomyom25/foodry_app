import 'package:flutter/material.dart';
import 'package:foodry_app/components/my_button.dart';
import 'package:foodry_app/components/my_cart_tile.dart';
import 'package:foodry_app/models/cart_item.dart';
import 'package:foodry_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child){
        //cart
        final userCart = restaurant.cart;

        //UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("My Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //limpiar carrito
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        //cancelar
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel")
                          ),
                        //aceptar
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes")
                          ),
                      ],
                    ),
                    );
                },
                icon: Icon(Icons.delete)
                ),
            ],
          ),
          body: Column(
            children: [
              //lista del carrito
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty 
                    ?  const Expanded(
                      child: Center(
                        child: Text("Cart is empty...")),
                    )
                    : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index){
                
                          //item individual
                          final cartItem = userCart[index];
                
                          //titulo IU
                          return MyCartTile(cartItem: cartItem);
                
                        },
                        ),
                      ),
                  ],
                ),
              ),
              //boton para pagar
              MyButton(
                text: "Go to checkout",
                onTap: (){}
                ),
                const SizedBox(height: 25,),
            ],
          ),
        );
      }
      );
  }
}
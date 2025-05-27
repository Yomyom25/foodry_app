import 'package:flutter/material.dart';
import 'package:foodry_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Your Location"),
            content: const TextField(
              decoration: InputDecoration(hintText: "Enter address..."),
            ),
            actions: [
              //cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),

              //save button
              MaterialButton(
                onPressed: () {
                  //Actualizar direccion
                  String newAddress = textController.text;
                  context.read<Restaurant>().updateDeliveryAddress(newAddress);
                  
                  Navigator.pop(context);
                  textController.clear();
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver Now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //Direccion
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  ),

                //Drop menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

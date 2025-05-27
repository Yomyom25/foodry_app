import 'package:flutter/material.dart';
import 'package:foodry_app/components/my_receipt.dart';
import 'package:foodry_app/models/restaurant.dart';
import 'package:foodry_app/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //acceso a la bd
  FirestoreService db = FirestoreService();

  @override
  void initState(){
    super.initState();

    //agregar la orden a la BD
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDataBase(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
        body: const Column(
          children: [
            MyReceipt(),
          ],
        ),
      );
  }

  //LLama al delivery
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration( color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            //perfil del repartidor
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.person)),
            ),
            const SizedBox(width: 10),
            //detalles
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mitch Koko",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                Text("Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),
                ),
              ],
            ),

            const Spacer(),

            Row(
              children: [
            //boton de mensaje
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
                ),
            ),

            const SizedBox(width: 10),
            //Boton de llamada
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.call),
                color: Colors.green,
                ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

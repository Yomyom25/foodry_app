import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener una coleccion
  final CollectionReference orders =
  FirebaseFirestore.instance.collection('orders');

  //guardar el orden de la 
  Future<void> saveOrderToDataBase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,

      //mas
    });
  }

}
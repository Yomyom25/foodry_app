import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text; // Cambiado a minúscula
  final IconData? icon;
  final void Function()? onTap; // Añadido espacio entre 'Function' y '()'

  const MyDrawerTile({
    super.key,
    required this.text, // Cambiado a minúscula
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
            ),
          ),
          leading: Icon(icon, color: Theme.of(context).colorScheme.inversePrimary,),
        onTap: onTap,
      ),
    );
  }
}

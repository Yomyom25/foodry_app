import 'package:flutter/material.dart';
import 'package:foodry_app/auth/login_or_register.dart';
import 'package:foodry_app/models/restaurant.dart';
import 'package:foodry_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      //tema
      ChangeNotifierProvider(
        create: (context) => ThemeProvider()
        ),

      //restaurant
      ChangeNotifierProvider(
        create: (context) => Restaurant()
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

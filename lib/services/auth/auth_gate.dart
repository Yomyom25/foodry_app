import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodry_app/pages/home_Page.dart';
import 'package:foodry_app/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //si el usuario ya esta loggeado
          if (snapshot.hasData) {
            return const HomePage();
          }

          //si el usuario NO esta loggeado
          else {
            return const LoginOrRegister();
          }

        }
        ),
    );
  }
}
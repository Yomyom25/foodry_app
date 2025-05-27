import 'package:flutter/material.dart';
import 'package:foodry_app/components/my_button.dart';
import 'package:foodry_app/components/my_textfield.dart';
import 'package:foodry_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function ()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  //editores de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Metodo para registrarse
  void register() async {
    //Autenticacion
    final _authService = AuthService();

    //Comprueba las contraseña para crear el usuario
    if (passwordController.text == confirmPasswordController.text) {
      //Crea el usuario
      try {
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
            ),
          );
      }
    }

    //mensaje de error
    else {
        showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match!"),
            ),
          );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(height: 25),
                    
                // mesagge, slogan
                Text(
                  "Let's Create a Account For You",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 25),
                    
                //email textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                    
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                    
                //confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                    
                //button
                MyButton(text: "Sing Up ", onTap: register),
                const SizedBox(height: 25),
                    
                //Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox( width: 4),
                    GestureDetector(
                      onTap: widget.onTap ,
                      child: Text("Login now",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
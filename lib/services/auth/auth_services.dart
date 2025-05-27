import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instancia de FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Obtener usuario actual
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Iniciar sesión con email y contraseña
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      // Si el usuario está registrado
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Si hay algún error
      throw Exception(e.code);
    }
  }

  // Método para registrarse
    Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      // Si el usuario está registrado
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Si hay algún error
      throw Exception(e.code);
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

// Imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
YA VERIFICADO CON EL TUTORIAL DE LA PÁGINA OFICIAL
*/

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  // Constructor
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn = googleSignIn ?? GoogleSignIn();
  
  // SignInWithGoogle retorna un FirebaseUser
  Future<FirebaseUser> signInWithGoogle() async {
    //obtenemos una instancia de googleSignIn
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();    
    //obtenemos una autenticación de la instancia googleSignIn
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    //Guardamos el toquen de acceso y el idToken de la autenticación  en credential
    final AuthCredential credential =GoogleAuthProvider.getCredential
    (
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    //se hace el logueo con las credenciales obtenidas de google 
    await _firebaseAuth.signInWithCredential(credential);
    //Retorna un usuario Firebase ya logueado 
    return _firebaseAuth.currentUser();
  }

  // SignInWithCredentials
  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  // SignUp - Registro
  // TODO cambiamos la linea Future<void> signUp({String email, String password}) async{
  Future<void> signUp({String email, String password}) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  // SignOut desloguea ambas instancias 
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
    ]);
  }

  // Esta logueado? retorna verdadero o falso
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  // Obtener usuario retorna el email del usuario
  /*
  AQUI PODEMOS DEFINIR QUE RETORNE MAS VALORES QUE DESEEMOS
  */
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
}

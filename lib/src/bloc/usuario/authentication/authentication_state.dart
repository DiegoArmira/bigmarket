import 'package:equatable/equatable.dart';

/*
Clase ya revisada con el tutorial de la página oficial
*/ 


//LOS VALORES QUE RETORNA EL BLOC

//TODO No se para que es esta linea pero inecesaria part of 'authentication_bloc.dart';
//Creamos una clase abstracta con el motivo de poder comparar cualquier instancia 
//ya que todas extienden de la misma clase abstracta AhutenticationState
abstract class AuthenticationState extends Equatable {
  //una constante definida en timepo de compilación 
  const AuthenticationState();


  @override
  List<Object> get props => [];
}

// Tres estados:
// No inicializado -> Usuario en pantalla de inicio
// Autenticado -> Usuario en vista Home
// No autenticado -> Usuario realizando Login

//TODO elimine este bloque
// class Uninitialized extends AuthenticationState{
//   @override
//   String toString() => 'No inicializado';
// }


class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String displayName;

  const AuthenticationSuccess(this.displayName);
  
  //sin esto no podriamos comparar adecuadamente cada instancia de la class abstract
  //siempre hay que pasarle cada propiedad que tenga la clase en =>[...]
  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'AuthenticationSuccess { displayName: $displayName }';
}

//TODO cambiado por el bloque de arriba 
// class Authenticated extends AuthenticationState {
//   final String displayName;

//   const Authenticated(this.displayName);

//   @override
//   List<Object> get props => [displayName];

//   @override
//   String toString() => 'Autenticado - displayName :$displayName';
// }

class AuthenticationFailure extends AuthenticationState {}

// class Unauthenticated extends AuthenticationState {
//   @override
//   String toString() => 'No autenticado';
// }
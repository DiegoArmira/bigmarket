import 'package:equatable/equatable.dart';


/*
CLASE YA CAMBIADA CON LA VERSION DEL TUTORIAL DE LA PÁGINA OFICIAL
*/

//EVENTOS QUE SERAN LOS QUE SE ENVIAN AL BLOC PARA RETORNAR UN ESTADO

abstract class AuthenticationEvent extends Equatable {
  //const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// Tres eventos:
// App Started
// LoggedIn
// LoggedOut

//class AppStarted extends AuthenticationEvent{}
class AuthenticationStarted extends AuthenticationEvent{}

//class LoggedIn extends AuthenticationEvent{}
class AuthenticationLoggedIn extends AuthenticationEvent{}

// class LoggedOut extends AuthenticationEvent{}
class AuthenticationLoggedOut extends AuthenticationEvent{}
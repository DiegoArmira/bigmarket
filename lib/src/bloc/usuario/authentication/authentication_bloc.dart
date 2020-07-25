import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bigmarket/src/bloc/usuario/authentication/bloc.dart';
import 'package:bigmarket/src/repository/usuario_repositorio.dart';
import 'package:meta/meta.dart';

/*
ACTUALIZADO CON EL TUTORIAL DE LA PAGINA OFICIAL DE BLOC
*/

//TRANSFORMA EVENTOS DE AUTHENTICATION POR ESTADOS DE AUTHENTICATION

// EVENTOS: AuthenticationStarted, AuthenticationLoggedIn, AuthenticationLoggedOut
//ESTADOS: AuthenticationInitial, AuthenticationSuccess, AuthenticationFailure
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
    : assert(userRepository != null),
    _userRepository = userRepository, super(AuthenticationInitial());
    //_userRepository = userRepository,super(AuthenticationInitial());

  // @override
  // AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event,) async* 
  {
    //Verificamos los eventos para transformarlos en estados 
    // AuthenticationStarted >> AuthenticationInitial
    if (event is AuthenticationStarted)
    {
      //yield* _mapAppStartedToState();
      yield* _mapAuthenticationStartedToState();
    }
    // AuthenticationLoggedIn >> AuthenticationSuccess
    if (event is AuthenticationLoggedIn) 
    {
      //yield* _mapLoggedInToState();
      yield* _mapAuthenticationLoggedInToState();
    }
    //AuthenticationLoggedOut >> AuthenticationFailure
    if (event is AuthenticationLoggedOut) 
    {
      //yield* _mapLoggedOutToState();
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    //si isSigneIn es nulo no esta logueado nadie 
    if (isSignedIn) {
      //en name traemos el correo de la instancia 
      final name = await _userRepository.getUser();
      //Retornamos un estado logueado AuthenticationSuccess con el valor 
      yield AuthenticationSuccess(name);
    } else {
      //retornamos un estado de fallo en el logueo 
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    //Retornamos un estado logueado AuthenticationSuccess con el valor que posee globalmente _userRepository
    //await es utilizada para procesos asincronos es esta parte esta diciendo que primero se ejecute la linea await _uwerRepository.getUser()
    yield AuthenticationSuccess(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    //Retornamos un estado fallo de autenticación que significa que se deslogue
    yield AuthenticationFailure();
    //deslogueamos todos las credenciales globales 
    _userRepository.signOut();
  }

/*
  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final user = await _userRepository.getUser();
        yield await Future.delayed(Duration(seconds: 5), (){
          return Authenticated(user);
        });
      }
      else {
        yield await Future.delayed(Duration(seconds: 5), (){
          return Unauthenticated();
        });
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
*/
}

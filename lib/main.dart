import 'package:bigmarket/splash_screen.dart';
import 'package:bigmarket/src/bloc/usuario/authentication/bloc.dart';
import 'package:bigmarket/src/bloc/usuario/login/login_screen.dart';
import 'package:bigmarket/src/pages/intro/presentation_ini.dart';
import 'package:bigmarket/src/pages/navigation/HomeScree.dart';
import 'package:bigmarket/src/repository/usuario_repositorio.dart';
import 'package:bigmarket/src/bloc/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
             return SplashScreen();
            //return PresentationInitial();
          }
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: _userRepository);
            //return Login();
          }
          if (state is AuthenticationSuccess) {
            return HomeScreen(name: state.displayName);
            //return Login();
          }
          return SplashScreen();
          //return PresentationInitial();
        },
      ),
    );
  }
}






// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     WidgetsFlutterBinding.ensureInitialized();
//     final UserRepository userRepository = UserRepository();
//     return MaterialApp(
//       title: 'BigMarket App',
//       //quitar la barra debug con la siguiente linea en false
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData
//       (
//         //doy aspectos generales de diseño al inicio de la APP (fondo blanco, tipo de letra, otros...)
//         brightness: Brightness.light,
//         canvasColor: Colors.transparent,
//         primarySwatch: Colors.blue,
//         fontFamily: "Montserrat", 
//       ),
//       home: BlocProvider(
//         create: (context) => AuthenticationBloc(userRepository: userRepository)
//         //le pasamos el evento inicializar
//         ..add(AuthenticationStarted()),
//         child: PresentationInitial(userRepository: userRepository),

//       )
      
//       //PresentationInitial(),
//     );
//   }
// }

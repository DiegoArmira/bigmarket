
//import 'package:ecommerce_int2/app_properties.dart';
import 'package:bigmarket/src/bloc/usuario/usuario_bloc.dart';
import 'package:bigmarket/src/bloc/usuario/usuario_state.dart';
import 'package:flutter/material.dart';
import 'package:bigmarket/src/pages/general/properties_template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'register_page.dart';

import 'package:bigmarket/src/bloc/usuario/authentication/bloc.dart';
import 'package:bigmarket/src/repository/usuario_repositorio.dart';

class Login extends StatefulWidget {
  
  //final UsuarioBloc _usuarioBloc;
  //final UserRepository _userRepository;

  @override
  _LoginState createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  TextEditingController email =     TextEditingController(text: 'ejemplo@email.com');
  TextEditingController password =  TextEditingController(text: '12345678');
  //final UserRepository _userRepository;
  /*
  AQUI SE CREAN LAS VARIABLES DE TIPO BLOC
  */
   final UsuarioBloc _usuarioBloc = UsuarioBloc();
   final UserRepository userRepository = UserRepository();
   //WidgetsFlutterBinding.ensureInitialized();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    
    //final _usuarioBloc = Bloc(initialState)
    //final UsuarioBloc usuarioBloc = BlocProvider<UsuarioBloc>();
    /*
    * ESPACIO DE WIDGET UTILIZADOS (LLAMADOS) EN EL SCAFOLD 
    */

    Widget welcomeBack = Text(
      'Bienvenida /do inicia sesión y comienza a explorar',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget spacerText = Text(
      '\n',
      /* style: TextStyle
      (
        color: Colors.white,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        shadows: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(0, 5),
            blurRadius: 10.0,
          )
        ]
      ), */
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Inicia sesión usando tu correo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterPage()));
          _usuarioBloc.add(UsuarioEvent.logueo);
        },
        child: SingleChildScrollView(
                  child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 80,
            child: Center(
                child: new Text("Log In",
                    style: const TextStyle(
                        color: const Color(0xfffefefe),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0))),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(236, 60, 3, 1),
                      Color.fromRGBO(234, 60, 3, 1),
                      Color.fromRGBO(216, 78, 16, 1),
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: BorderRadius.circular(9.0)),
          ),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: email,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      controller: password,
                      style: TextStyle(fontSize: 16.0),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
          ),
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Recuperar ? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Recuperar contraseña',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    Widget variableSesion = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context, state)
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sesion iniciada ? ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 14.0,
                ),
              ),
              InkWell(
                onTap: () {
                  // if(state==0)
                  // {
                  //   _usuarioBloc.add(UsuarioEvent.logueo);
                  //   //varUsuario.sesion=1;
                  // }else 
                  // {
                  //   _usuarioBloc.add(UsuarioEvent.noLogueo);
                  //   //usuarioBloc.add(UsuarioEvent.noLogueo);
                  // }
                  
                },
                child: Text(
                  ("vacio por el momento"),
                  // (state).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          );
        },
      )
    );


    
    return Scaffold(
      
      //resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset:false,
      body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/background_lapso.jpg'),
                    fit: BoxFit.cover)
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: transparentYellow,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              //se incorpor el widget SingleChildScrollView 
              //permite acomodar los elementos con la intervención del teclado para ingresar texto
              child: SingleChildScrollView(
                            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    spacerText,
                    spacerText,
                    //Spacer(flex: 5),
                    welcomeBack,
                    spacerText,
                    //Spacer(),
                    subTitle,
                    //Spacer(flex: 2),
                    loginForm,
                    //Spacer(flex: 2),
                    spacerText,
                    forgotPassword,
                    variableSesion
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

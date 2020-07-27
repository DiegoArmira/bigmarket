//import 'package:ecommerce_int2/app_properties.dart';
//import 'package:ecommerce_int2/screens/auth/welcome_back_page.dart';
import 'package:bigmarket/src/bloc/usuario/usuario_bloc.dart';
import 'package:bigmarket/src/bloc/usuario/usuario_state.dart';
import 'package:bigmarket/src/pages/auth/login.dart';
import 'package:bigmarket/src/pages/general/properties_template.dart';
import 'package:bigmarket/src/repository/usuario_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*
CLASE QUE SOLO GENERA UNA ANIMACIÓN DE INICIO DE LA APP 
*/

class PresentationInitial extends StatefulWidget {
  @override
  _PresentationInitialState createState() => _PresentationInitialState();
}

class _PresentationInitialState  extends State<PresentationInitial>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;
  
// App({Key key, @required UserRepository userRepository})
//       : assert(userRepository != null),
//         _userRepository = userRepository,
//         super(key: key);
  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      duration: Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        //BlocProvider.of<CounterBloc>(context).onIncrement(),
        //BlocProvider.of<UsuarioBloc>(context).onEvent(UsuarioEvent.logueo);
        setState(() {});
        
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(
          MaterialPageRoute(
          //builder: BlocProvider<UsuarioBloc>();
          
          builder: (_) => Login()
          
          )
        );

    /* BlocProvider<UsuarioBloc>(
      bloc: _usuarioBloc,
      child:Login(),
    ); */
    /* Navigator.of(context)
        .pushReplacement(
          /* MaterialPageRoute(
          //builder: BlocProvider<UsuarioBloc>();
          //builder: (_) => Login()
          
          ) */
        ); */
  }

  Widget build(BuildContext context) {
    final UsuarioBloc _usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_lapso.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: new Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/logo_lapso.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<UsuarioBloc,UsuarioState>(
                    builder: (context,varSesion){
                      return RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: 'Powered by '),
                              TextSpan(
                                  text: (varSesion.sesion).toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                      );
                    },
                      
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

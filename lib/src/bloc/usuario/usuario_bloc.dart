import 'package:bloc/bloc.dart';
//import 'package:bigmarket/src/bloc/usuario/usuario_event.dart';
import 'package:bigmarket/src/bloc/usuario/usuario_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



enum UsuarioEvent { logueo, noLogueo }

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState.initial());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    switch (event) {
      case UsuarioEvent.logueo:
        yield UsuarioState.update(1);
        break;
      case UsuarioEvent.noLogueo:
        yield UsuarioState.update(0);
        break;
      default:
        addError(Exception('unsupported event'));
    }
    /* final _currentState = currentState;
    if (event is logueado) {
      yield CounterState(counter: _currentState.counter + 1);
    } else if (event is noLogueado) {
      yield CounterState(counter: _currentState.counter - 1);
    }else if (event is errorLogueo)
    {
      print("Error al loguearse");
    } */
  }
}



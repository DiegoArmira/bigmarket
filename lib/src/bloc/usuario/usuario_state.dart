class UsuarioState {
  final int  sesion;

  const UsuarioState({this.sesion});

  factory UsuarioState.initial() => UsuarioState(sesion: 0);
  factory UsuarioState.update(val) => UsuarioState (sesion: val);
}

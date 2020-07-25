class User {
  String nombre; 
  int edad; 
  int id; 
  String other; 

  User (String nombre, int edad, int id)
  {
    this.nombre=nombre;
    this.edad=edad;
    this.id=id;
  }

  int getId ()
  {
    return this.id;
  }

  String getNombre()
  {
    return this.nombre;
  }
}
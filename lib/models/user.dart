class Usuario {

  int id;
  String name;
  String lastname;
  String mail;
  String pass;

  static const tblUser = 'usuarios';
  static const colId = 'id';
  static const colName = 'name';
  static const colLastname = 'lastname';
  static const colMail = 'mail';
  static const colPassword = 'password';

  Usuario({this.id, this.name, this.lastname, this.mail, this.pass});

  Usuario.fromMap(Map<String, dynamic> map){
    id = map[colId];
    name = map[colName];
    lastname = map[colLastname];
    mail = map[colMail];
    pass = map[colPassword];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colId: id,
      colName: name,
      colLastname: lastname,
      colMail: mail,
      colPassword: pass
    };
    if (id != null) map[colId] = id;
    return map;
  }


}

import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario.internal();

  //factory tipo de construccion unico
  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario.internal();
  SharedPreferences _prefs;
  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //recordar nombres
  set recordarNombres(String nombres) {
    _prefs.setString('nombres', nombres);
  }

  get nombres {
    return _prefs.getString('nombres') ?? 'Sin datos';
  }

  //recordar apellidos
  set recordarApellidos(String apellidos) {
    _prefs.setString('apellidos', apellidos);
  }

  get apellidos {
    return _prefs.getString('apellidos') ?? 'Sin datos';
  }

  //recordar telefono
  set recordarTelefono(String telefono) {
    _prefs.setString('telefono', telefono);
  }

  get telefono {
    return _prefs.getString('telefono') ?? 'Sin datos';
  }

  //recordar telefono
  set recordarEmail(String email) {
    _prefs.setString('email', email);
  }

  get email {
    return _prefs.getString('email') ?? 'Sin datos';
  }

  //recordar avatar
  set recordarAvatar(String avatar) {
    _prefs.setString('avatar', avatar);
  }

  get avatar {
    return _prefs.getString('avatar') ??
        'https://www.facebook.com/photo?fbid=2825457071108244&set=a.1387033258283973';
  }

  borrarPreferencias() {
    _prefs.remove('avatar');
    _prefs.remove('email');
    _prefs.remove('nombres');
    _prefs.remove('apellidos');
    _prefs.remove('telefono');
  }
}

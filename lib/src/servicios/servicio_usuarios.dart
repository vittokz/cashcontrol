import 'package:cashcontrol/src/modelos/usuario_modelo.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  String _url = "http://localhost/nomyApp/";

  void addUsuario(Usuario nuevoUsuario) {
    http.post(_url + "usuarios/addUsuario.php", body: {nuevoUsuario});
  }
}

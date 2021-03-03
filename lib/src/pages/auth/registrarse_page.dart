import 'package:cashcontrol/src/modelos/usuario_modelo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrarsePage extends StatefulWidget {
  @override
  _RegistrarsePageState createState() => _RegistrarsePageState();
}

final _formKey = GlobalKey<FormState>();

class _RegistrarsePageState extends State<RegistrarsePage> {
  TextEditingController _nombresController;
  TextEditingController _apellidosController;
  TextEditingController _telefonoController;
  TextEditingController _emailController;
  TextEditingController _claveController;
  Usuario nuevoUsuario = Usuario();

  @override
  void initState() {
    _nombresController = TextEditingController();
    _apellidosController = TextEditingController();
    _telefonoController = TextEditingController();
    _emailController = TextEditingController();
    _claveController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _form(context),
      ],
    ));
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 60.0,
            ),
          ),
          contenedorInput(context)
        ],
      ),
    );
  }

  Widget contenedorInput(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.25),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0)
          ]),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text('Registrar sus datos', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 15.0),
            _avatar(context),
            SizedBox(height: 15.0),
            crearInput('Nombres', Icons.person, TextInputType.text,
                _nombresController),
            SizedBox(height: 15.0),
            crearInput('Apellidos', Icons.people_alt, TextInputType.text,
                _apellidosController),
            SizedBox(height: 15.0),
            crearInput('Telefono', Icons.phone, TextInputType.phone,
                _telefonoController),
            SizedBox(height: 20.0),
            crearInput('Email', Icons.email, TextInputType.emailAddress,
                _emailController),
            SizedBox(height: 20.0),
            _crearPassword(),
            SizedBox(height: 20.0),
            _crearBoton()
          ],
        ),
      ),
    );
  }

  Widget crearInput(String titulo, IconData icono, TextInputType tipo,
      TextEditingController campo) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: campo,
        keyboardType: tipo,
        decoration: InputDecoration(
          icon: Icon(icono, color: Color.fromRGBO(130, 9, 255, 1)),
          hintText: titulo,
          labelText: titulo,
        ),
        onChanged: (value) {
          if (titulo == 'Nombres') {
            nuevoUsuario.nombres = value;
          }
          if (titulo == 'Apellidos') {
            nuevoUsuario.apellidos = value;
          }
          if (titulo == 'Telefono') {
            nuevoUsuario.telefono = value;
          }
          if (titulo == 'Email') {
            nuevoUsuario.email = value;
          }
        },
        validator: (value) {
          if (titulo == 'Nombres' || titulo == 'Apellidos') {
            if (value.length < 3) {
              return 'Minimo 3 carácteres';
            } else {
              return null;
            }
          }
          if (titulo == 'Telefono') {
            if (value.length < 10 || value.length > 10) {
              return 'Son 10 carácteres';
            } else {
              return null;
            }
          }
        },
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    return Center(
        child: RaisedButton.icon(
      label: Text('Cargar foto'),
      icon: Icon(Icons.camera_alt),
      onPressed: () {
        _showChoiceDialog(context);
      },
    ));
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Seleccione"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galeria"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camara"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _openGallery(BuildContext context) async {
    final imagen = ImagePicker();
    final archivo = await imagen.getImage(source: ImageSource.gallery);
    print(archivo.path);
    /*resp = await _servicio.subirImagen(archivo);
    _prefs.recordarLinkFoto = resp;
    print('ruta: ${_prefs.linkFoto}'); */
    setState(() {
      //nuevoUsuario.avatar = archivo;
    });
  }

  _openCamera(BuildContext context) async {
    final imagen = ImagePicker();
    final archivo = await imagen.getImage(source: ImageSource.camera);
    print(archivo.path);
    /*  resp = await _servicio.subirImagen(archivo);
    _prefs.recordarLinkFoto = resp;
    print('ruta: ${_prefs.linkFoto}'); */
    setState(() {});
  }

  Widget _mostrarImagen() {
    final size = MediaQuery.of(context).size;
    // resp = _prefs.linkFoto;
    return Center(
      child: CircleAvatar(
        maxRadius: size.width * 0.3,
        backgroundImage: NetworkImage(
            'https://www.latercera.com/resizer/Am6Tr2ws8JnL4CHLfU_Humpr56Q=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/XMJRWZH5N5CBXPL67NAKBGXFNI.jpg'),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: _claveController,
          obscureText: true,
          decoration: InputDecoration(
            icon:
                Icon(Icons.lock_outline, color: Color.fromRGBO(130, 9, 255, 1)),
            labelText: 'Contraseña',
          ),
          onChanged: (value) {
            nuevoUsuario.password = value;
          },
          validator: (value) {
            if (value.length < 3) {
              return 'Minimo 3 carácteres';
            } else {
              return null;
            }
          },
        ));
  }

  Widget _crearBoton() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Registrar'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Color.fromRGBO(130, 9, 255, 1),
        textColor: Colors.white,
        onPressed: () {
          if (!_formKey.currentState.validate()) return;
          print(nuevoUsuario.nombres);
          print(nuevoUsuario.apellidos);
          print(nuevoUsuario.telefono);
          print(nuevoUsuario.email);
          print(nuevoUsuario.password);
        });
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoApp = Container(
      height: size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromRGBO(130, 9, 255, 1),
            Color.fromRGBO(183, 114, 255, 1)
          ])),
    );

    return Stack(
      children: <Widget>[
        fondoApp,
        Positioned(top: 90.0, left: 30.0, child: circulo()),
        Positioned(top: -40.0, right: -30.0, child: circulo()),
        Positioned(bottom: -50.0, right: -10.0, child: circulo()),
        Positioned(bottom: 120.0, right: 20.0, child: circulo()),
        Positioned(bottom: -50.0, left: -20.0, child: circulo()),
        Container(
          padding: EdgeInsets.only(top: 45.0),
          child: Column(
            children: <Widget>[_mostrarImagen()],
          ),
        )
      ],
    );
  }

  Widget circulo() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(151, 12, 235, 0.1)),
    );
  }
}

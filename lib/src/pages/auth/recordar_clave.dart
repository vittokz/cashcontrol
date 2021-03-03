import 'package:cashcontrol/src/bloc/bloc_login.dart';
import 'package:cashcontrol/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class RecordarClavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Recordar Contraseña', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _crearTelefono(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc)
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Regresar a login.',
                style: TextStyle(
                    color: Color.fromRGBO(130, 9, 255, 1),
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearTelefono(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.telefonoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.phone, color: Color.fromRGBO(130, 9, 255, 1)),
                hintText: '3212880350',
                labelText: 'Número telefónico',
                //counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeTelefono,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Recordar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Color.fromRGBO(130, 9, 255, 1),
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('Telefono: ${bloc.telefono}');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoApp = Container(
      height: size.height * 0.4,
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
        Positioned(bottom: -10.0, left: -20.0, child: circulo()),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('NOMY APP',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
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
          color: Color.fromRGBO(151, 12, 235, 0.2)),
    );
  }
}

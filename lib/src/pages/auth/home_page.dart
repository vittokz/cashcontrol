import 'package:cashcontrol/src/widgets/logo_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [pantallaInicio(context)],
      ),
    );
  }

  Widget pantallaInicio(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          contenedorPrincipal(context),
          tituloApp(),
          contenedorFooter(context)
        ],
      ),
    );
  }

  Widget tituloApp() {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          SizedBox(height: 20, width: double.infinity),
          Text(
            'NOMY APP',
            style:
                TextStyle(fontSize: 36, color: Colors.white, letterSpacing: 3),
          ),
          SizedBox(height: 50, width: double.infinity),
          LogoPage(),
        ],
      ),
    );
  }

  Widget contenedorPrincipal(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
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
  }

  Widget boton(BuildContext context, String titulo, String ruta) {
    return RaisedButton(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black12),
      ),
      onPressed: () {
        Navigator.pushNamed(context, ruta);
      },
      textColor: Colors.black,
      child: Text(titulo, style: TextStyle(fontSize: 16)),
    );
  }

  Widget contenedorFooter(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      margin: EdgeInsets.only(top: size.height * 0.6),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 42,
              child: boton(context, 'Registrarse', '/registrarse'),
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 42,
              child: boton(context, 'Ingresar', '/login'),
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

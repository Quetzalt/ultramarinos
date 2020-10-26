import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          crearFondo(context),
          loginForm(context),
        ],
      ),
    );
  }

  // Fondo de la app
  Widget crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Fondo de la app gradiente
    final fondoBlue = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(31, 97, 141, 1.0),
            Color.fromRGBO(36, 113, 163, 1.0),
          ],
        ),
      ),
    );

    // Circulos del fondo
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        fondoBlue,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
            padding: EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
                SizedBox(height: 10.0, width: double.infinity),
                Text('Castellano',
                    style: TextStyle(color: Colors.white, fontSize: 25.0))
              ],
            )),
      ],
    );
  }

  Widget loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
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
              ],
            ),
            child: Column(
              children: [
                Text('Ingreso',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue)),
                SizedBox(height: 60.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton()
              ],
            ),
          ),
          FlatButton(
            child: Text('¿No tienes cuenta? Registrate',
                style: TextStyle(color: Colors.blue)),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return StreamBuilder(
      // stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // Caja de texto eamil del formulario
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Colors.blue),
              hintText: 'ejemplo@correo.com',
              labelText: 'CorreoElectronico',
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget _crearPassword() {
    return StreamBuilder(
      // stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // Caja de texto password del formulario
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            // onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    return StreamBuilder(
        // stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingresar'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'menu');
        },
      );
    });
  }

  // login() async {
  //   // Map info = await usuarioProvider.login(bloc.email, bloc.password);

  //   if (info['ok']) {
  //     Navigator.pushReplacementNamed(context, 'home');
  //   } else {
  //     mostrarAlerta(context, info['mensaje']);
  //   }
  // }
}

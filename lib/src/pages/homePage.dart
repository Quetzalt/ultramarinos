import 'package:flutter/material.dart';
// import 'package:ultramarinos/src/pages/loginPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                  height: 200,
                  child: Image.network('https://imagenti.li/Zkg.png')),
              SizedBox(height: 100),
              Text(
                'Castellano Ultramarino',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              SizedBox(height: 200),
              SizedBox(
                child: Material(
                  elevation: 5.0,
                  // borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    minWidth: 250,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'login'),
                    child: Text(
                      "Continuar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

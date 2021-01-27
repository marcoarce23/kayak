import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:neurona/Presentation/Pages/Core/Option/CodeQRPage.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

import 'dart:async';

class HuellaPage extends StatefulWidget {
  @override
  _HuellaPageState createState() => _HuellaPageState();
}

class _HuellaPageState extends State<HuellaPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'No Authorizado';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Autentificando';
        
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Escanea tu huella para autentificar',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Autentificando';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorizado' : 'No Authorizado';
    setState(() {
      _authorized = message;
       navegation(context, CodeQrPage());
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Autentificar huella'),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(),
                // Image(image: AssetImage("assets/image/babycare1.jpg")),

                //     Image.asset(
                ////        "assets/image/babycare1.jpg",
                // fit: BoxFit.cover,
                // height: size.height * 0.70,
                // width: size.width,
                //    ),
                Center(
                  child: Image(
                    image: NetworkImage(IMAGE_LOGO),
                    fit: BoxFit.cover,
                  ),
                ),

                Text('Tienes biometrico: $_canCheckBiometrics\n'),
                RaisedButton(
                  child: const Text('Check biometrics'),
                  onPressed: _checkBiometrics,
                  color: Colors.orange,
                ),
                Text('Esta disponible ?: $_availableBiometrics\n'),
                RaisedButton(
                  child: const Text('Verifica disponibilidad'),
                  onPressed: _getAvailableBiometrics,
                  color: Colors.blueGrey,
                ),
                Text('Estado para el pago: $_authorized\n'),
                RaisedButton(
                  child: Text(
                    _isAuthenticating ? 'No autorizado' : 'Pagar boleto',
                  ),
                  onPressed:
                      _isAuthenticating ? _cancelAuthentication : _authenticate,
                  color: Colors.green,
                )
              ])),
    ));
  }
}

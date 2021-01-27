import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neurona/Presentation/Pages/Home/HomePage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';


class GoReturnPage extends StatefulWidget {
  GoReturnPage({Key key}) : super(key: key);

  @override
  _GoReturnPageState createState() => _GoReturnPageState();
}

class _GoReturnPageState extends State<GoReturnPage> {
  var size;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerSearch = TextEditingController();
  bool isManual = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[900],
        drawer: DrawerMenu(),
        body: _form(context),
          floatingActionButton: floatButton(Colors.transparent, context,
          FaIcon(FontAwesomeIcons.arrowLeft), HomePage()),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.all(5),
          child: Column(children: [
            sizedBox(0, 15),
            textFormField(
                'La Paz, Bolivia (IDA)',
                'La Paz, Bolivia',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite, size: 20)),
            textFormField(
                'Santa Cruz de la Sierra, Bolivia (VUELTA)',
                'Santa Cruz, Bolivia',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeArrival,
                    color: ThemeDefault.themeWhite, size: 20)),
            textFormField(
                'Indica una ciudad, aeropuerto o lugar',
                'Indica una ciudad, aeropuerto o lugar',
                '_errorText',
                FaIcon(FontAwesomeIcons.building,
                    color: ThemeDefault.themeWhite)),
            _airport('Añadir aeropeurtos cercanos'),
            textFormField(
                'Ubicación actal',
                '_helperText',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.locationArrow,
                    color: ThemeDefault.themeWhite)),
            textFormField(
                'Cualquier lugar',
                'Cualquier lugar',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.ggCircle,
                    color: ThemeDefault.themeWhite)),
            textFormFieldSufix(
                'Restablecer',
                'Ubicaciones recientes',
                'Ubicaciones recientes',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.ggCircle,
                    color: ThemeDefault.themeWhite)),
            textFormFieldHelper(
                'Santa Cruz de la Sierra, Bolivia',
                'Viru Viru Intl',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite, size: 20),
                'VVI'),
            textFormFieldHelper(
                'La Paz, Bolivia',
                'El Alto Intl',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite, size: 20),
                'LPB'),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBox(0, 10),
                  Text('Búsquedas recientes',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  textFormFieldHelper(
                      'LPB -> VVI',
                      'dom. 18 de ene.',
                      'El campo no puede ser vacio.',
                      FaIcon(FontAwesomeIcons.plane,
                          color: ThemeDefault.themeWhite, size: 20),
                      'LPB'),
                  textFormFieldHelper(
                      'LPB <-> VVI',
                      'sáb. 16 ene. - sáb. 16 ene.',
                      'El campo no puede ser vacio.',
                      FaIcon(FontAwesomeIcons.plane,
                          color: ThemeDefault.themeWhite, size: 20),
                      'LPB'),
                ],
              ),
            ),
            copyRigthBlack(),
          ]),
        ),
      ),
    );
  }

  Widget _airport(String text) {
    return SwitchListTile(
      value: isManual,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Habilitar opción si desea añadir ato.',
        style: TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.bold,
        ),
      ),
      activeColor: ThemeDefault.themePlomo,
      onChanged: (value) => setState(() {
        isManual = value;
      }),
    );
  }
}

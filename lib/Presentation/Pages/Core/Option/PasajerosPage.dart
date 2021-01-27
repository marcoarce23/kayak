import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/SalesPage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class PasajeroPage extends StatefulWidget {
  PasajeroPage({Key key}) : super(key: key);

  @override
  _PasajeroPagePageState createState() => _PasajeroPagePageState();
}

class _PasajeroPagePageState extends State<PasajeroPage> {
  var size;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerSearch = TextEditingController();
  int groupValue = 0;
  String valorMaletas = '1';
  String equipaje = '1';
  int numMaletas = 1;
  int numEquipaje = 1;

  String _valorEquipaje = '1';
  String _valorMaleteta = '1';

  List<String> _comboMaleta = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  List<String> _comboEquipaje = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[900],
        appBar: //appBar('VENTAS & GASTOS'),
            AppBar(
          backgroundColor: ThemeDefault.themeBlack,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: ThemeDefault.themeWhite, size: 18),
          elevation: 13.0,
          actions: <Widget>[
            avatarCircle(IMAGE_LOGO, 25.0),
          ],
        ),
        drawer: DrawerMenu(),
        body: SingleChildScrollView(
          child: _goReturnPage(context),
        ),
        floatingActionButton: floatButton(Colors.transparent, context,
            FaIcon(FontAwesomeIcons.arrowLeft), SalesPage()),
      ),
    );
  }

  Widget _goReturnPage(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.all(8),
          child: Column(children: [
            sizedBox(0, 15),
            Container(
              width: MediaQuery.of(context).size.height * 0.60,
              alignment: Alignment.topLeft,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Pasajeros',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                  sizedBox(0, 15),
                  _comboEquipajes(context),
                  _comboMaletas(context),
                  _comboMayores(context),
                  _comboJoven(context),
                  _comboNino(context),
                  _comboBebe(context),
                  _comboBebeRegazo(context),
                  sizedBox(0, 10),
                ],
              ),
            ),
            TextFormField(
              initialValue: '-',
            ),
            sizedBox(0, 5),
            _button(context, 'Aplicar cambios', 18.0, 20.0),
            copyRigthBlack(),
          ]),
        ),
      ),
    );
  }

  Widget _button(
      BuildContext context, String text, double fontSize, double edgeInsets) {
    return GFButton(
      padding: EdgeInsets.symmetric(horizontal: edgeInsets),
      text: text,
      textStyle: TextStyle(fontSize: fontSize),
      textColor: ThemeDefault.themeWhite,
      color: Colors.orangeAccent,
      icon:
          FaIcon(FontAwesomeIcons.checkCircle, color: ThemeDefault.themeWhite),
      shape: GFButtonShape.pills,
      onPressed: () {
        navegation(context, SalesPage());
      },
    );
  }

  Widget _comboBebeRegazo(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Bebé en regazo (menor de 2):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 20.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  Widget _comboBebe(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Bebé en asiento (menor de 2):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 20.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  Widget _comboNino(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Niño (2 - 11):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 130.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  Widget _comboJoven(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Joven (12 - 17):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 110.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  Widget _comboMayores(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Mayores (de 65 de años):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 40.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  Widget _comboEquipajes(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Adultos (18-64):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 100.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarEquipaje(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _listarEquipaje() {
    List<DropdownMenuItem<String>> lista = new List();

    _comboEquipaje.forEach((comboEquipaje) {
      lista.add(DropdownMenuItem(
        child: Text(comboEquipaje,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black)),
        value: comboEquipaje,
      ));
    });
    return lista;
  }

  Widget _comboMaletas(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15.0),
        Text('Estudiantes (mayores de 18 años):',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(width: 10.0),
        DropdownButton(
          value: _valorEquipaje,
          icon: FaIcon(FontAwesomeIcons.sort, color: Colors.white),
          items: _listarMaleta(),
          onChanged: (value) {
            setState(() {
              _valorEquipaje = value;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _listarMaleta() {
    List<DropdownMenuItem<String>> lista = new List();

    _comboMaleta.forEach((comboMaleta) {
      lista.add(DropdownMenuItem(
        child: Text(comboMaleta,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black)),
        value: comboMaleta,
      ));
    });
    return lista;
  }
}

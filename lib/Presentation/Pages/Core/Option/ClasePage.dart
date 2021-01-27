import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/SalesPage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class ClasePage extends StatelessWidget {
  var size;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerSearch = TextEditingController();
  final GFBottomSheetController _controller = GFBottomSheetController();
  int groupValue = 0;

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
                  Text('Cambiar tipo de Clase',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  sizedBox(0, 15),
                  ListTile(
                    tileColor: Colors.white24,
                    selectedTileColor: Colors.white,
                    title: Text('Económica',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white60, fontSize: 17)),
                    leading: Radio(
                      focusColor: Colors.red,
                      activeColor: Colors.green,
                      autofocus: true,
                      value: 'Económica preferente',
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                  ),
                  sizedBox(0, 4),
                  ListTile(
                    tileColor: Colors.white24,
                    selectedTileColor: Colors.white,
                    title: Text('Económica preferente',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white60, fontSize: 17)),
                    leading: Radio(
                      focusColor: Colors.white,
                      activeColor: Colors.white,
                      autofocus: true,
                      value: 'Primera',
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                  ),
                  sizedBox(0, 4),
                  ListTile(
                    tileColor: Colors.white24,
                    selectedTileColor: Colors.white,
                    title: Text('Negocios',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white60, fontSize: 17)),
                    leading: Radio(
                      focusColor: Colors.white,
                      activeColor: Colors.white,
                      autofocus: true,
                      value: 'Económica',
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                  ),
                  sizedBox(0, 4),
                  ListTile(
                    tileColor: Colors.white24,
                    selectedTileColor: Colors.white,
                    title: Text('Primera',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white60, fontSize: 17)),
                    leading: Radio(
                      focusColor: Colors.white,
                      activeColor: Colors.white,
                      autofocus: true,
                      value: 'Económica preferente',
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                  ),
                  sizedBox(0, 10),
                ],
              ),
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
}

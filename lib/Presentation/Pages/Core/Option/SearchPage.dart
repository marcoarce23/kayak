import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/types/gf_border_type.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/HuellaPage.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/SalesPage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class BuyPage extends StatefulWidget {
  BuyPage({Key key}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
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
          padding: EdgeInsets.all(3),
          child: Column(children: [
            sizedBox(0, 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black54,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              width: MediaQuery.of(context).size.height * 0.60,
              alignment: Alignment.topLeft,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.moneyBillAlt,
                          color: ThemeDefault.themeWhite),
                      sizedBox(10, 0),
                      Text('Comprar boletos',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 21)),
                    ],
                  ),
                  sizedBox(0, 10),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: GFBorder(
                            color: Colors.white,
                            dashedLine: [1, 0],
                            type: GFBorderType.rect,
                            child: GFButton(
                              buttonBoxShadow: true,
                              elevation: 5,
                              onPressed: null,
                              text: "Recomendado \n   Bs.364.00",
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Container(
                          child: GFBorder(
                            color: Colors.white,
                            dashedLine: [2, 0],
                            type: GFBorderType.rect,
                            child: GFButton(
                              buttonBoxShadow: true,
                              elevation: 5,
                              onPressed: null,
                              text: "Económicos\n   Bs.314.00",
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        Container(
                          child: GFBorder(
                            color: Colors.white,
                            dashedLine: [1, 0],
                            type: GFBorderType.rect,
                            child: GFButton(
                              buttonBoxShadow: true,
                              elevation: 5,
                              onPressed: null,
                              text: "Promoción\n  Bs.302.00",
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  dividerBlack(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ), //Offset
                          blurRadius: 10.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.grey[900],
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            sizedBox(10, 0),
                            FaIcon(FontAwesomeIcons.planeArrival,
                                color: Colors.orangeAccent, size: 20),
                            sizedBox(10, 0),
                            GFButton(
                              buttonBoxShadow: true,
                              elevation: 5,
                              onPressed: null,
                              text: "El mejor",
                              color: Colors.blueGrey,
                            ),
                            sizedBox(10, 0),
                            GFButton(
                              buttonBoxShadow: true,
                              elevation: 5,
                              onPressed: null,
                              text: "El más barato",
                              color: Colors.lightGreen[200],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            sizedBox(5, 0),
                            avatarCircle(IMAGE_LOGO, 20.0),
                            sizedBox(30, 0),
                            Text(
                              "02:05     -°-°-     22:16\n LPB 20h 11m VVI",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            sizedBox(16, 0),
                            FaIcon(FontAwesomeIcons.moneyCheck,
                                color: Colors.green, size: 20),
                            sizedBox(7, 0),
                            Text(
                              "Bs.374.00",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            // color: Colors.grey[900],
                          ],
                        ),
                        sizedBox(0, 15),
                        Row(
                          children: [
                            sizedBox(5, 0),

                            Text(
                              "Amaszonas/Ecónomica/Ida-Vuelta",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            sizedBox(30, 0),
                            FaIcon(FontAwesomeIcons.heart,
                                color: Colors.red, size: 20),

                            // color: Colors.grey[900],
                          ],
                        ),
                      ],
                    ),
                  ),
                  sizedBox(0, 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                        width: 8,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ), //Offset
                          blurRadius: 10.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.grey[900],
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            sizedBox(10, 0),
                            FaIcon(FontAwesomeIcons.planeArrival,
                                color: Colors.orangeAccent, size: 20),

                            // GFButton(
                            //   buttonBoxShadow: true,
                            //   elevation: 5,
                            //   onPressed: null,
                            //   text: "El mejor",
                            //   color: Colors.blueGrey,
                            // ),
                            // sizedBox(10, 0),
                            // GFButton(
                            //   buttonBoxShadow: true,
                            //   elevation: 5,
                            //   onPressed: null,
                            //   text: "El más barato",
                            //   color: Colors.lightGreen[200],
                            // ),
                          ],
                        ),
                        sizedBox(0, 10),
                        Row(
                          children: [
                            sizedBox(5, 0),
                            avatarCircle(IMAGE_LOGO, 20.0),
                            sizedBox(26, 0),
                            Text(
                              "10:20   -°-°-   21:16+1\n LPB 20h 11m VVI",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            sizedBox(16, 0),
                            FaIcon(FontAwesomeIcons.moneyCheck,
                                color: Colors.green, size: 20),
                            sizedBox(7, 0),
                            Text(
                              "Bs.304.00",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            // color: Colors.grey[900],
                          ],
                        ),
                        sizedBox(0, 5),
                        Row(
                          children: [
                            sizedBox(5, 0),

                            Text(
                              "Amaszonas/Primera/Ida",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            sizedBox(90, 0),
                            FaIcon(FontAwesomeIcons.heart,
                                color: Colors.red, size: 20),

                            // color: Colors.grey[900],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(0, 5),
            _button(context, 'Comprar pasajes', 18.0, 20.0),
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
        navegation(context, HuellaPage());
      },
    );
  }
}

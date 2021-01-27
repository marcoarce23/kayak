import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/ReserPages.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/SalesPage.dart';
import 'package:neurona/Presentation/Pages/Home/IntroPage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotate;
  var size;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerSearch = TextEditingController();
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 10000));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[900],
        appBar: //appBar('VENTAS & GASTOS'),
            AppBar(
          backgroundColor: ThemeDefault.themeBlack,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: ThemeDefault.themeWhite, size: 18),
          elevation: 13.0,
          // title: Text('AMASZONAS DIGITAL'.toUpperCase(),
          //     style: TextStyle(
          //       color: ThemeDefault.themeAmarillo,
          //       // fontFamily: FONT_FAMILY_CM_SANS_SERIF,
          //       fontSize: 19,
          //     )),
          actions: <Widget>[
            avatarCircle(IMAGE_LOGO, 25.0),
          ],
        ),
        drawer: DrawerMenu(),
        body: _form(context),
        // bottomSheet: GFBottomSheet(
        //   controller: _controller,
        //   maxContentHeight: 280,
        //   stickyHeaderHeight: 100,
        //   stickyHeader: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
        //     child: const GFListTile(
        //       avatar: GFAvatar(
        //         backgroundImage: AssetImage('assets image here'),
        //       ),
        //       titleText: 'Información AmasVentas',
        //       subtitleText: 'Ver detalle de los paquetes.',
        //     ),
        //   ),
        //   contentBody: Container(
        //     height: 400,
        //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //     child: ListView(
        //       shrinkWrap: true,
        //       physics: ScrollPhysics(),
        //       children: [
        //         Column(
        //           children: [
        //             GFToast(
        //               text: 'Comprar pasajes',
        //               button: GFButton(
        //                 onPressed: () {
        //                   navegation(context, IntroPage());
        //                 },
        //                 text: 'Detalle',
        //                 type: GFButtonType.transparent,
        //                 color: GFColors.SUCCESS,
        //               ),
        //               autoDismiss: false,
        //             ),
        //             sizedBox(0, 3),
        //             GFToast(
        //               text: 'Consultar Itinerarios',
        //               button: GFButton(
        //                 onPressed: () {
        //                   navegation(context, IntroPage());
        //                 },
        //                 text: 'Detalle',
        //                 type: GFButtonType.transparent,
        //                 color: GFColors.SUCCESS,
        //               ),
        //               autoDismiss: false,
        //             ),
        //             sizedBox(0, 3),
        //             GFToast(
        //               text: 'Reserva de pasajes',
        //               button: GFButton(
        //                 onPressed: () {
        //                   navegation(context, IntroPage());
        //                 },
        //                 text: 'Detalle',
        //                 type: GFButtonType.transparent,
        //                 color: GFColors.SUCCESS,
        //               ),
        //               autoDismiss: false,
        //             ),
        //             sizedBox(0, 5),
        //             Center(
        //                 child: Text(
        //               'Disfruta de los grandes beneficios que te brida la familia Amaszonas.',
        //               style: TextStyle(
        //                   fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
        //             )),
        //           ],
        //         )
        //       ],
        //     ),
        //   ),
        //   stickyFooter: Container(
        //     color: GFColors.SUCCESS,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Text(
        //           'Mas información',
        //           style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.white),
        //         ),
        //         Text(
        //           'info@amaszonas.bo',
        //           style: TextStyle(fontSize: 15, color: Colors.white),
        //         ),
        //       ],
        //     ),
        //   ),
        //   stickyFooterHeight: 30,
        // ),
        // floatingActionButton: FloatingActionButton(
        //     backgroundColor: GFColors.SUCCESS,
        //     child: _controller.isBottomSheetOpened
        //         ? Icon(Icons.keyboard_arrow_down)
        //         : Icon(Icons.keyboard_arrow_up),
        //     onPressed: () {
        //       _controller.isBottomSheetOpened
        //           ? _controller.hideBottomSheet()
        //           : _controller.showBottomSheet();
        //     }),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            _cabecera(),
            _dashboard(),
            _dashboardLiquid(),
            sizedBox(0, 8),

            TextFormField(
              initialValue: 'Ingrese un vuelo',
              style: TextStyle(color: Colors.white),
              strutStyle: StrutStyle(
                fontStyle: FontStyle.normal,
              ),
              decoration: new InputDecoration(
                helperStyle: TextStyle(color: Colors.white),
                //  labelText: "Buscar un vueloss",
                helperText: "Buscar un vuelos",
                fillColor: Colors.white10,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              onTap: () {
                navegation(context, ReservPage());
              },
            ),

            sizedBox(0, 15),
            Text(
              'Promociones vigentes',
              style: kTitleAppBar,
            ),
            dividerBlack(),
            sizedBox(0, 15),
            //  _title('PROMOCIONS'),

            InkWell(
              onTap: () {
                navegation(context, ReservPage());
              },
              child: gfListTile(
                  Text('Promoción Año nuevo 2021', style: kSubTitleCardStyle),
                  Text('Cochabamba -> Santa Cruz - 5 ene',
                      style: kSubTitleCardStyle),
                  Text('Bs. 340 a cualquier lugar',
                      style: kSubSubTitleCardStyle),
                  FaIcon(FontAwesomeIcons.planeArrival,
                      color: ThemeDefault.themeWhite),
                  avatarCircle(IMAGE_LOGO, 25.0),
                  null,
                  null),
            ),
            sizedBox(0, 8),
            InkWell(
              onTap: () {
                navegation(context, ReservPage());
              },
              child: gfListTile(
                  Text('Promoción Navideña', style: kSubTitleCardStyle),
                  Text('La Paz -> Cochabamba, 21 dic',
                      style: kSubTitleCardStyle),
                  Text('Bs. 210 a cualquier lugar',
                      style: kSubSubTitleCardStyle),
                  FaIcon(FontAwesomeIcons.planeDeparture,
                      color: ThemeDefault.themeWhite),
                  avatarCircle(IMAGE_LOGO, 25.0),
                  null,
                  null),
            ),
            sizedBox(0, 8),
            InkWell(
              onTap: () {
                navegation(context, ReservPage());
              },
              child: gfListTile(
                  Text('Promoción Occidente', style: kSubTitleCardStyle),
                  Text('La Paz -> Oruro - Cochabamba, 2 nov',
                      style: kSubTitleCardStyle),
                  Text('Bs. 440 a cualquier lugar',
                      style: kSubSubTitleCardStyle),
                  FaIcon(FontAwesomeIcons.planeArrival,
                      color: ThemeDefault.themeWhite),
                  avatarCircle(IMAGE_LOGO, 25.0),
                  null,
                  null),
            ),
            dividerBlack(),
            sizedBox(0, 8),
            // GFCarousel(
            //   items: imageList.map(
            //     (url) {
            //       return Container(
            //         margin: EdgeInsets.all(8.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //           child:
            //               Image.network(url, fit: BoxFit.cover, width: 1000.0),
            //         ),
            //       );
            //     },
            //   ).toList(),
            //   onPageChanged: (index) {
            //     setState(() {
            //       index;
            //     });
            //   },
            // ),
            // _title('LUGARES TURISTICOS'),
            // GFCarousel(
            //   items: imageList.map(
            //     (url) {
            //       return Container(
            //         margin: EdgeInsets.all(8.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //           child:
            //               Image.network(url, fit: BoxFit.cover, width: 1000.0),
            //         ),
            //       );
            //     },
            //   ).toList(),
            //   onPageChanged: (index) {
            //     setState(() {
            //       index;
            //     });
            //   },
            // ),

            Text(
              'Informate con Amaszonas',
              style: kTitleAppBar,
            ),
            Text(
              'Disfruta de la experiencia con la familia Amaszonas.',
              style: kSubSubTitleCardStyle,
            ),
            _dashboard2(),
            copyRigthBlack(),
          ],
        ),
      ),
    );
  }

  Widget _cabecera() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hola, Gustavo Zalles Arrieta',
          style: kTitleAppBar,
        ),
        Text(
          'Estas son tus ventas....',
          style: kTitleAppBar,
        ),
        // Text(
        //   DateTime.now().toString(),
        //   style: kTitleAppBar,
        // ),
        sizedBox(0, 10),
      ],
    );
  }


  Widget _dashboard() {
    return Row(
      children: [
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.green,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                '  Por Mes [Bs.]   ',
                IntroPage()),
          ],
        ),
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.orange,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                '  Por Mes [Bs.]  ',
                IntroPage()),
          ],
        ),
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.red,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                '  Por Mes [Bs.] ',
                IntroPage()),
          ],
        ),
      ],
    );
  }

  Widget _dashboardLiquid() {
    return Row(
      children: [
        sizedBox(30, 0),
        Column(
          children: [
            liquidIndicatorTitle(
                '${'90'}', 20, '${'90'}%', 'Aceptable', Colors.green, 50, 50),
            Text(
              'Ventas',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        sizedBox(25, 0),
        Column(
          children: [
            liquidIndicatorTitle(
                '${'60'}', 20, '${'60'}%', 'Aceptable', Colors.yellow, 50, 50),
            Text(
              'Pasajes',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        sizedBox(25, 0),
        Column(
          children: [
            liquidIndicatorTitle(
                '${'30'}', 20, '${'30'}%', 'Aceptable', Colors.red, 50, 50),
            Text(
              'Clientes',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        sizedBox(25, 0),
        Column(
          children: [
            liquidIndicatorTitle(
                '${'100'}', 20, '${'90'}%', 'Aceptable', Colors.blue, 50, 50),
            Text(
              'Reservas',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _dashboard2() {
    return Row(
      children: [
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.pinkAccent,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                'Venta-Pasajes',
                SalesPage()),
            // liquidIndicatorTitle(
            //     '${'40'}', 20, '${'40'}%', 'Aceptable', Colors.green, 50, 50),
            //  Text('Ventas: 40%'),
          ],
        ),
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.lightBlue,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                'Reserva-Pasajes',
                ReservPage()),
          ],
        ),
        Column(
          children: [
            _crearBotonRedondeado(
                Colors.greenAccent,
                FaIcon(
                  FontAwesomeIcons.moneyBill,
                  color: Colors.white,
                  size: 40,
                ),
                'Itinerarios-Vuelos',
              SalesPage()),
          ],
        ),
      ],
    );
  }

  // Widget _text(
  //     TextEditingController controllerHR,
  //     String initialValue,
  //     String labelText,
  //     int maxLength,
  //     int maxLines,
  //     String hintText,
  //     bool isValidate,
  //     FaIcon icon,
  //     Color hoverColor,
  //     Color fillColor,
  //     Color focusColor) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
  //     child: TextFormField(
  //       initialValue: initialValue,
  //       textCapitalization: TextCapitalization.sentences,
  //       enableSuggestions: true,
  //       maxLength: maxLength,
  //       autocorrect: true,

  //       //   autovalidate: false,
  //       maxLines: maxLines,
  //       cursorColor: ThemeDefault.themeWhite,
  //       toolbarOptions:
  //           ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
  //       keyboardType: TextInputType.text,
  //       // controller: controller,
  //       decoration: inputDecoration(
  //           hintText, labelText, icon, hoverColor, fillColor, focusColor),
  //       onChanged: (value) {
  //         setState(() {
  //           controllerHR.text = value;
  //         });
  //       },
  //       onSaved: (value) => controllerHR.text = value,
  //     ),
  //   );
  // }

  // Widget _button(
  //     BuildContext context, String text, double fontSize, double edgeInsets) {
  //   return GFButton(
  //     padding: EdgeInsets.symmetric(horizontal: edgeInsets),
  //     text: text,
  //     textStyle: TextStyle(fontSize: fontSize),
  //     textColor: ThemeDefault.themeWhite,
  //     color: ThemeDefault.themePlomo,
  //     icon: FaIcon(FontAwesomeIcons.search, color: ThemeDefault.themeWhite),
  //     shape: GFButtonShape.pills,
  //     onPressed: () {},
  //   );
  // }

  Widget _crearBotonRedondeado(
      Color color, FaIcon icono, String texto, Widget widget) {
    return InkWell(
      onTap: () {
        navegation(context, widget);
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            height: 100.0,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color:
                  ThemeDefault.themeWhite, //Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(15.0),

              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 1.0,
                    offset: Offset(1.0, 2.0),
                    spreadRadius: 1.5)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: icono,
                ),
                Text(texto, style: TextStyle(color: color)),
                SizedBox(height: 5.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
} // finde la clase

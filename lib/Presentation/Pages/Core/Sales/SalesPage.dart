import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/tabs/gf_tabbar_view.dart';
import 'package:getflutter/components/tabs/gf_tabs.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:neurona/Presentation/Pages/Core/Option/ClasePage.dart';
import 'package:neurona/Presentation/Pages/Core/Option/EquipajePage.dart';
import 'package:neurona/Presentation/Pages/Core/Option/EscapaPage.dart';
import 'package:neurona/Presentation/Pages/Core/Option/PasajerosPage.dart';
import 'package:neurona/Presentation/Pages/Core/Option/SearchPage.dart';

import 'package:neurona/Presentation/Pages/Core/Sales/ReserPages.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class SalesPage extends StatelessWidget {
  var size;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerSearch = TextEditingController();
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black54,
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
          child: GFTabs(
            tabBarColor: Colors.grey[900],
            indicatorColor: ThemeDefault.themeWhite,
            height: MediaQuery.of(context).size.height * 0.80,
            indicatorWeight: 2.0,
            initialIndex: 0,
            length: 3,
            tabs: <Widget>[
              Tab(
                // icon: FaIcon(FontAwesomeIcons.planeArrival,
                //     color: ThemeDefault.themeWhite),
                child: Text(
                  "Ida y vuelta".toUpperCase(),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Tab(
                // icon: FaIcon(FontAwesomeIcons.planeDeparture,
                //     color: ThemeDefault.themeWhite),
                child: Text(
                  "Solo ida".toUpperCase(),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Tab(
                // icon: FaIcon(FontAwesomeIcons.planeSlash,
                //     color: ThemeDefault.themeWhite),
                child: Text(
                  "Multidestino".toUpperCase(),
                  style: TextStyle(fontSize: 12.5),
                ),
              ),
            ],
            tabBarView: GFTabBarView(
              children: <Widget>[
                _goReturnPage(context),
                _goPage(context),
                _goReturnPage(context),
              ],
            ),
          ),
        ),
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
        //                   navegation(context, HomePage());
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
        //                   navegation(context, HomePage());
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
        //                   navegation(context, HomePage());
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

  Widget _goPage(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.all(8),
          child: Column(children: [
            sizedBox(0, 15),
            textFormFieldFuntion(
                'La Paz, Bolivia (IDA)',
                'La Paz, Bolivia',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite, size: 20),
                context,
                ReservPage()),
            textFormField(
                'lun., 18 ene.',
                'lun., 18 ene.',
                '_errorText',
                FaIcon(FontAwesomeIcons.calendar,
                    color: ThemeDefault.themeWhite)),
            Container(
              width: MediaQuery.of(context).size.height * 0.60,
              alignment: Alignment.topLeft,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBox(0, 10),
                  Text('Opciones',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  sizedBox(0, 25),
                  SizedBox(
                    width: 150,
                    child: textFormFieldFuntion(
                        '3 viajeros',
                        'dom. 18 de ene.',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.user,
                            color: Colors.white60, size: 20),
                        context,
                        PasajeroPage()),
                  ),
                  SizedBox(
                    width: 150,
                    child: textFormFieldFuntion(
                        'Negocios',
                        'Negocios',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.chair,
                            color: Colors.white60, size: 20),
                        context,
                        ClasePage()),
                  ),
                  textFormFieldFuntion(
                      '0 equipajes de mano, 0 equipaje documentado',
                      'sáb. 16 ene. - sáb. 16 ene.',
                      'El campo no puede ser vacio.',
                      FaIcon(FontAwesomeIcons.shoppingBag,
                          color: Colors.white60, size: 20),
                      context,
                      EquipajePage()),
                  SizedBox(
                    width: 190,
                    child: textFormFieldFuntion(
                        'Todas las escalas',
                        'sáb. 16 ene. - sáb. 16 ene.',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.addressCard,
                            color: Colors.white60, size: 20),
                        context,
                        EscalaPage()),
                  ),
                ],
              ),
            ),
            sizedBox(0, 15),
            _button(context, 'Buscar vuelos', 18.0, 20.0),
            copyRigthBlack(),
          ]),
        ),
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
            textFormFieldFuntion(
                'La Paz, Bolivia (IDA)',
                'La Paz, Bolivia',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite, size: 20),
                context,
                ReservPage()),
            textFormFieldFuntion(
                'Santa Cruz de la Sierra, Bolivia (VUELTA)',
                'Santa Cruz, Bolivia',
                'El campo no puede ser vacio.',
                FaIcon(FontAwesomeIcons.planeArrival,
                    color: ThemeDefault.themeWhite, size: 20),
                context,
                ReservPage()),
            textFormField(
                'lun., 18 ene.',
                'lun., 18 ene.',
                '_errorText',
                FaIcon(FontAwesomeIcons.calendar,
                    color: ThemeDefault.themeWhite)),
            Container(
              width: MediaQuery.of(context).size.height * 0.60,
              alignment: Alignment.topLeft,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBox(0, 10),
                  Text('Opciones',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                  sizedBox(0, 25),
                  SizedBox(
                    width: 150,
                    child: textFormFieldFuntion(
                        '3 viajeros',
                        'dom. 18 de ene.',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.user,
                            color: Colors.white60, size: 20),
                        context,
                        PasajeroPage()),
                  ),
                  SizedBox(
                    width: 150,
                    child: textFormFieldFuntion(
                        'Negocios',
                        'Negocios',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.chair,
                            color: Colors.white60, size: 20),
                        context,
                        ClasePage()),
                  ),
                  textFormFieldFuntion(
                      '0 equipajes de mano, 0 equipaje documentado',
                      'sáb. 16 ene. - sáb. 16 ene.',
                      'El campo no puede ser vacio.',
                      FaIcon(FontAwesomeIcons.shoppingBag,
                          color: Colors.white60, size: 20),
                      context,
                      EquipajePage()),
                  SizedBox(
                    width: 190,
                    child: textFormFieldFuntion(
                        'Todas las escalas',
                        'sáb. 16 ene. - sáb. 16 ene.',
                        'El campo no puede ser vacio.',
                        FaIcon(FontAwesomeIcons.addressCard,
                            color: Colors.white60, size: 20),
                        context,
                        EscalaPage()),
                  ),
                ],
              ),
            ),
            sizedBox(0, 15),
            _button(context, 'Buscar vuelos', 18.0, 20.0),
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
      icon: FaIcon(FontAwesomeIcons.search, color: ThemeDefault.themeWhite),
      shape: GFButtonShape.pills,
      onPressed: () {
        navegation(context, BuyPage());
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: Colors.black,
//         appBar: //appBar('VENTAS & GASTOS'),
//             AppBar(
//           backgroundColor: ThemeDefault.themeBlack,
//           shadowColor: Colors.black,
//           iconTheme: IconThemeData(color: ThemeDefault.themeWhite, size: 18),
//           elevation: 13.0,
//           // title: Text('AMASZONAS DIGITAL'.toUpperCase(),
//           //     style: TextStyle(
//           //       color: ThemeDefault.themeAmarillo,
//           //       // fontFamily: FONT_FAMILY_CM_SANS_SERIF,
//           //       fontSize: 19,
//           //     )),
//           actions: <Widget>[
//             avatarCircle(IMAGE_LOGO, 25.0),
//           ],
//         ),
//         drawer: DrawerMenu(),
//         body: _form(context),
//         // bottomSheet: GFBottomSheet(
//         //   controller: _controller,
//         //   maxContentHeight: 280,
//         //   stickyHeaderHeight: 100,
//         //   stickyHeader: Container(
//         //     decoration: BoxDecoration(
//         //         color: Colors.white,
//         //         boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
//         //     child: const GFListTile(
//         //       avatar: GFAvatar(
//         //         backgroundImage: AssetImage('assets image here'),
//         //       ),
//         //       titleText: 'Información AmasVentas',
//         //       subtitleText: 'Ver detalle de los paquetes.',
//         //     ),
//         //   ),
//         //   contentBody: Container(
//         //     height: 400,
//         //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         //     child: ListView(
//         //       shrinkWrap: true,
//         //       physics: ScrollPhysics(),
//         //       children: [
//         //         Column(
//         //           children: [
//         //             GFToast(
//         //               text: 'Comprar pasajes',
//         //               button: GFButton(
//         //                 onPressed: () {
//         //                   navegation(context, IntroPage());
//         //                 },
//         //                 text: 'Detalle',
//         //                 type: GFButtonType.transparent,
//         //                 color: GFColors.SUCCESS,
//         //               ),
//         //               autoDismiss: false,
//         //             ),
//         //             sizedBox(0, 3),
//         //             GFToast(
//         //               text: 'Consultar Itinerarios',
//         //               button: GFButton(
//         //                 onPressed: () {
//         //                   navegation(context, IntroPage());
//         //                 },
//         //                 text: 'Detalle',
//         //                 type: GFButtonType.transparent,
//         //                 color: GFColors.SUCCESS,
//         //               ),
//         //               autoDismiss: false,
//         //             ),
//         //             sizedBox(0, 3),
//         //             GFToast(
//         //               text: 'Reserva de pasajes',
//         //               button: GFButton(
//         //                 onPressed: () {
//         //                   navegation(context, IntroPage());
//         //                 },
//         //                 text: 'Detalle',
//         //                 type: GFButtonType.transparent,
//         //                 color: GFColors.SUCCESS,
//         //               ),
//         //               autoDismiss: false,
//         //             ),
//         //             sizedBox(0, 5),
//         //             Center(
//         //                 child: Text(
//         //               'Disfruta de los grandes beneficios que te brida la familia Amaszonas.',
//         //               style: TextStyle(
//         //                   fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
//         //             )),
//         //           ],
//         //         )
//         //       ],
//         //     ),
//         //   ),
//         //   stickyFooter: Container(
//         //     color: GFColors.SUCCESS,
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //       children: [
//         //         Text(
//         //           'Mas información',
//         //           style: TextStyle(
//         //               fontSize: 18,
//         //               fontWeight: FontWeight.bold,
//         //               color: Colors.white),
//         //         ),
//         //         Text(
//         //           'info@amaszonas.bo',
//         //           style: TextStyle(fontSize: 15, color: Colors.white),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         //   stickyFooterHeight: 30,
//         // ),
//         // floatingActionButton: FloatingActionButton(
//         //     backgroundColor: GFColors.SUCCESS,
//         //     child: _controller.isBottomSheetOpened
//         //         ? Icon(Icons.keyboard_arrow_down)
//         //         : Icon(Icons.keyboard_arrow_up),
//         //     onPressed: () {
//         //       _controller.isBottomSheetOpened
//         //           ? _controller.hideBottomSheet()
//         //           : _controller.showBottomSheet();
//         //     }),
//       ),
//     );
//   }

//   Widget _form(BuildContext context) {
//     return SingleChildScrollView(
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             _cabecera(),

//             sizedBox(0, 13),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FaIcon(FontAwesomeIcons.solidIdBadge,
//                     color: ThemeDefault.themeWhite),
//                 Text(
//                   '     Compra del boleto',
//                   style: kTitleAppBar,
//                 ),
//               ],
//             ),
//             dividerBlack(),
//             sizedBox(0, 15),
//             //  _title('PROMOCIONS'),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('La Paz, Bolivia', style: kSubTitleCardStyle),
//                   Text('Paquete promocional', style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.planeArrival,
//                       color: Colors.orangeAccent),
//                   avatarCircle(IMAGE_LOGO, 10.0),
//                   null,
//                   null),
//             ),
//             sizedBox(0, 8),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('Santa Cruz de la Sierra, Bolivia',
//                       style: kSubTitleCardStyle),
//                   Text('Paquete promocional', style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.planeDeparture, color: Colors.green),
//                   avatarCircle(IMAGE_LOGO, 10.0),
//                   null,
//                   null),
//             ),
//             sizedBox(0, 8),

//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('mar, 2 feb. - mar., 9 feb.', style: kSubTitleCardStyle),
//                   Text('Fecha del itinerario', style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.calendarAlt,
//                       color: ThemeDefault.themeMostazaOscuro),
//                   avatarCircle(IMAGE_LOGO, 10.0),
//                   null,
//                   null),
//             ),
//             //  print('Entrooooo');
//             // }
//             // ),
//             dividerBlack(),
//             sizedBox(0, 15),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 sizedBox(30, 0),
//                 FaIcon(FontAwesomeIcons.plane, color: ThemeDefault.themeWhite),
//                 Text(
//                   '     Opciones del viajero',
//                   style: kSubTitleCardStyle,
//                 ),
//               ],
//             ),
//             sizedBox(0, 10),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('2 viajeros', style: kSubTitleCardStyle),
//                   Text('Puede agregar mas viajeros',
//                       style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.user,
//                       color: ThemeDefault.themeMostazaOscuro),
//                   null,
//                   null,
//                   null),
//             ),
//             sizedBox(0, 10),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('Viajero', style: kSubTitleCardStyle),
//                   Text('Puede cambiar clase', style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.businessTime,
//                       color: ThemeDefault.themeMostazaOscuro),
//                   null,
//                   null,
//                   null),
//             ),
//             sizedBox(0, 10),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('0 equipajes de mano, 0 equipaje documentado',
//                       style: kSubTitleCardStyle),
//                   Text('Puede modificar so datos',
//                       style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.shoppingBag,
//                       color: ThemeDefault.themeMostazaOscuro),
//                   null,
//                   null,
//                   null),
//             ),
//             sizedBox(0, 10),
//             InkWell(
//               onTap: () {
//                 navegation(context, ReservPage());
//               },
//               child: gfListTile(
//                   Text('Todas las escalas', style: kSubTitleCardStyle),
//                   Text('Puede modificar so datos',
//                       style: kSubSubTitleCardStyle),
//                   null,
//                   FaIcon(FontAwesomeIcons.plane,
//                       color: ThemeDefault.themeMostazaOscuro),
//                   null,
//                   null,
//                   null),
//             ),
//             sizedBox(0, 10),
//             _button(context, 'Comprar pasaje', 18.0, 20.0),

//             copyRigthBlack(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _button(
//       BuildContext context, String text, double fontSize, double edgeInsets) {
//     return GFButton(
//       padding: EdgeInsets.symmetric(horizontal: edgeInsets),
//       text: text,
//       textStyle: TextStyle(fontSize: fontSize),
//       textColor: ThemeDefault.themeWhite,
//       color: Colors.green,
//       icon: FaIcon(FontAwesomeIcons.search, color: ThemeDefault.themeWhite),
//       shape: GFButtonShape.pills,
//       onPressed: () {
//         navegation(context, HuellaPage());
//       },
//     );
//   }

//   Widget _cabecera() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Hola, Gustavo Zalles Arrieta',
//           style: kTitleAppBar,
//         ),
//         Text(
//           'Realice la compra de los pasajes....',
//           style: kTitleAppBar,
//         ),
//         // Text(
//         //   DateTime.now().toString(),
//         //   style: kTitleAppBar,
//         // ),
//         sizedBox(0, 10),
//       ],
//     );
//   }

//   Widget _title(String title) {
//     return Column(
//       children: [
//         Text(title),
//       ],
//     );
//   }

//   Widget _dashboardLiquid() {
//     return Row(
//       children: [
//         Column(
//           children: [
//             liquidIndicatorTitle(
//                 '${'90'}', 20, '${'90'}%', 'Aceptable', Colors.green, 50, 50),
//             Text('Ventas: 40%'),
//           ],
//         ),
//         Column(
//           children: [
//             liquidIndicatorTitle(
//                 '${'60'}', 20, '${'60'}%', 'Aceptable', Colors.yellow, 50, 50),
//             Text('Ventas: 40%'),
//           ],
//         ),
//         Column(
//           children: [
//             liquidIndicatorTitle(
//                 '${'30'}', 20, '${'30'}%', 'Aceptable', Colors.red, 50, 50),
//             Text('Ventas: 40%'),
//           ],
//         ),
//         Column(
//           children: [
//             liquidIndicatorTitle(
//                 '${'100'}', 20, '${'90'}%', 'Aceptable', Colors.blue, 50, 50),
//             Text('Ventas: 90%'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _text(
//       TextEditingController controllerHR,
//       String initialValue,
//       String labelText,
//       int maxLength,
//       int maxLines,
//       String hintText,
//       bool isValidate,
//       FaIcon icon,
//       Color hoverColor,
//       Color fillColor,
//       Color focusColor) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
//       child: TextFormField(
//         initialValue: initialValue,
//         textCapitalization: TextCapitalization.sentences,
//         enableSuggestions: true,
//         maxLength: maxLength,
//         autocorrect: true,

//         //   autovalidate: false,
//         maxLines: maxLines,
//         cursorColor: ThemeDefault.themeWhite,
//         toolbarOptions:
//             ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
//         keyboardType: TextInputType.text,
//         // controller: controller,
//         decoration: inputDecoration(
//             hintText, labelText, icon, hoverColor, fillColor, focusColor),
//         onChanged: (value) {
//           // setState(() {
//           //   controllerHR.text = value;
//           // });
//         },
//         onSaved: (value) => controllerHR.text = value,
//       ),
//     );
//   }
// } // finde la clase

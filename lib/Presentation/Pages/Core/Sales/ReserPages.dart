import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/tabs/gf_tabbar_view.dart';
import 'package:getflutter/components/tabs/gf_tabs.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/GoPage.dart';
import 'package:neurona/Presentation/Pages/Core/Sales/GoReturnPage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UXDrawerMenu.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Service/Constant.dart';

class ReservPage extends StatelessWidget {
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
        backgroundColor: Colors.black,
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
                icon: FaIcon(FontAwesomeIcons.planeArrival,
                    color: ThemeDefault.themeWhite),
                child: Text(
                  "Ida y vuelta".toUpperCase(),
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.planeDeparture,
                    color: ThemeDefault.themeWhite),
                child: Text(
                  "Solo ida".toUpperCase(),
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.planeSlash,
                    color: ThemeDefault.themeWhite),
                child: Text(
                  "Multidestino".toUpperCase(),
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
            tabBarView: GFTabBarView(
              children: <Widget>[
                GoReturnPage(),
                GoPage(),
                GoReturnPage(),
                // SingleChildScrollView(
                //   child: Container(
                //     child: Column(
                //       children: <Widget>[
                //         dividerBlack(),
                //         GoReturnPage(),
                //         //copyRigth(),
                //       ],
                //     ),
                //   ),
                // ),
                // SingleChildScrollView(
                //   child: Column(
                //     children: <Widget>[
                //       dividerBlack(),
                //       Shimmer.fromColors(
                //         baseColor: ThemeDefault.themeBlack,
                //         highlightColor: ThemeDefault.themeWhite,
                //         child: AutoSizeText(
                //           'Fixture de Partidos'.toUpperCase(),
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             fontSize: 20.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       GoReturnPage(),
                //       //copyRigth(),
                //     ],
                //   ),
                // ),
                // SingleChildScrollView(
                //   child: Column(
                //     children: <Widget>[
                //       dividerBlack(),
                //       Shimmer.fromColors(
                //         baseColor: ThemeDefault.themePlomo,
                //         highlightColor: ThemeDefault.themeMostazaOscuro,
                //         child: AutoSizeText(
                //           'TABLA DE POSICIONES',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             fontSize: 18.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       GoReturnPage(),
                //copyRigth(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Service/Constant.dart';
import 'package:page_transition/page_transition.dart';

/*=====================================================================================================================
CONTROLES GRAFICOS
=====================================================================================================================*/
TextFormField textFormFieldFuntion(String _initialValue, String _helperText,
    String _errorText, FaIcon _icon, BuildContext context, Widget _funtion) {
  return TextFormField(
    initialValue: _initialValue,
    scrollPadding: EdgeInsets.all(8),
    style: TextStyle(color: Colors.white),
    keyboardAppearance: Brightness.light,
    enableSuggestions: true,
    strutStyle: StrutStyle(
      fontStyle: FontStyle.normal,
    ),
    decoration: new InputDecoration(
      helperStyle: TextStyle(color: Colors.white),

      //  labelText: "Buscar un vueloss",
      // helperText: _helperText,S
      fillColor: Colors.white10,
      prefixIcon: _icon,
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
        return _errorText;
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
    onTap: () {
      navegation(context, _funtion);
    },
  );
}

TextFormField textFormField(
    String _initialValue, String _helperText, String _errorText, FaIcon _icon) {
  return TextFormField(
    initialValue: _initialValue,
    scrollPadding: EdgeInsets.all(8),
    style: TextStyle(color: Colors.white),
    keyboardAppearance: Brightness.light,
    enableSuggestions: true,
    strutStyle: StrutStyle(
      fontStyle: FontStyle.normal,
    ),
    decoration: new InputDecoration(
      helperStyle: TextStyle(color: Colors.white),

      //  labelText: "Buscar un vueloss",
      // helperText: _helperText,S
      fillColor: Colors.white10,
      prefixIcon: _icon,
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
        return _errorText;
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
  );
}

TextFormField textFormFieldHelper(String _initialValue, String _helperText,
    String _errorText, FaIcon _icon, String _suffix) {
  return TextFormField(
    initialValue: _initialValue,
    scrollPadding: EdgeInsets.all(8),
    style: TextStyle(color: Colors.white),
    keyboardAppearance: Brightness.light,
    enableSuggestions: true,
    strutStyle: StrutStyle(
      fontStyle: FontStyle.normal,
    ),
    decoration: new InputDecoration(
      helperStyle: TextStyle(color: Colors.white70, fontSize: 12),

      //   labelText: _helperText,
      helperText: _helperText,
      fillColor: Colors.white10,
      prefixIcon: _icon,
      suffix: Text(
        _suffix,
        style: TextStyle(color: Colors.blue),
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
        return _errorText;
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
  );
}

TextFormField textFormFieldSufix(String suffix, String _initialValue,
    String _helperText, String _errorText, FaIcon _icon) {
  return TextFormField(
    initialValue: _initialValue,
    scrollPadding: EdgeInsets.all(8),
    style: TextStyle(color: Colors.white),
    keyboardAppearance: Brightness.light,
    enableSuggestions: true,
    strutStyle: StrutStyle(
      fontStyle: FontStyle.normal,
    ),
    decoration: new InputDecoration(
      helperStyle: TextStyle(color: Colors.white),

      //  labelText: "Buscar un vueloss",
      // helperText: _helperText,S
      fillColor: Colors.white10,
      prefixIcon: _icon,
      suffix: Text(
        suffix,
        style: TextStyle(color: Colors.blue),
      ),
      suffixIcon: Icon(Icons.refresh, color: Colors.white70),
      filled: false,
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
        return _errorText;
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
  );
}

TextFormField textoWidget(TextEditingController controller, String label,
    String hintText, String helperText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        labelText: label, hintText: hintText, helperText: helperText),
  );
}

TextFormField textoLargoWidget(TextEditingController controller, String label,
    String hintText, String helperText) {
  return TextFormField(
    maxLines: 4,
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}

Widget floatButton(
    Color color, BuildContext context, FaIcon icon, Widget page) {
  return FloatingActionButton(
    onPressed: () {
      navegation(context, page);
    },
    elevation: 2.0,
    child: icon,
    backgroundColor: color,
  );
}

SliverAppBar silverAppBarWidget(Color backColor, Widget leadingOpcion,
    String title, List<Widget> actionsOpcion) {
  return SliverAppBar(
    backgroundColor: backColor,
    leading: leadingOpcion,
    elevation: 20,
    expandedHeight: 100.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(title,
          style: TextStyle(
            color: ThemeDefault.themeAmarillo,
            fontSize: 16.0,
          )),
    ),
    actions: actionsOpcion,
  );
}

Widget contenedorLista(
    List<Color> listaColores,
    IconData iconoFondo,
    IconData iconoIzquierdo,
    String titulo,
    String subtitulo,
    Function() onPress) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            ThemeDefault.themePlomo,
            ThemeDefault.themePlomo
          ] /*listaColores*/)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                top: -30,
                right: -60,
                child: FaIcon(
                  iconoFondo,
                  size: 120,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 20,
                  ),
                  FaIcon(
                    iconoIzquierdo,
                    size: 20,
                    color: ThemeDefault.themeAmarillo,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          titulo.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        AutoSizeText(
                          subtitulo,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronCircleRight,
                    size: 20,
                    color: ThemeDefault.themeAmarillo,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget loadingWidget() {
  return Center(
    child: Container(
      child: new CircularProgressIndicator(),
    ),
  );
}

Widget endDrawerUser() {
  return Drawer(
    child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          child: new Text("Header"),
        ),
        new ListTile(
          title: new Text("Item 1"),
        ),
      ],
    ),
  );
}

Widget endDrawerAdmin() {
  return Drawer(
    child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          child: new Text("Header"),
        ),
        new ListTile(
          title: new Text("Item 1"),
        ),
      ],
    ),
  );
}

// #

Divider dividerWidth(double thickness, Color color) {
  return Divider(
    thickness: thickness,
    color: color,
    endIndent: 20.0,
    indent: 20.0,
  );
}

SizedBox sizedBox(double ancho, double alto) {
  return SizedBox(
    width: ancho,
    height: alto,
  );
}

navegation(BuildContext context, Widget page) {
  Navigator.push(
      context,
      PageTransition(
        curve: Curves.bounceOut,
        type: PageTransitionType.rotate,
        alignment: Alignment.topCenter,
        child: page,
      ));
}

inputDecoration(String hintText, String labelText, FaIcon icon,
    Color hoverColor, Color fillColor, Color focusColor) {
  return InputDecoration(
    focusColor: focusColor,
    hintText: hintText,
    labelText: labelText,
    icon: icon,
    hoverColor: hoverColor,
    fillColor: fillColor,
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(25.0),
      borderSide: new BorderSide(),
    ),
  );
}

boxDecorationMenu(BuildContext context, String imagen) {
  return BoxDecoration(
    image: new DecorationImage(
      image: new NetworkImage(IMAGE_LOGO),
      fit: BoxFit.cover,
    ),
    color: ThemeDefault.themeMostazaOscuro,
  );
}

Widget liquidIndicatorTitle(String porcent, double fontSize, String label,
    String label1, Color color, double heigth, double width) {
  return Container(
    height: heigth,
    width: width,
    child: LiquidCircularProgressIndicator(
      value: double.parse(porcent) / 100,
      // Defaults to 0.5.
      valueColor: AlwaysStoppedAnimation(color),
      backgroundColor: Colors.white,
      borderColor: Colors.blueGrey,
      borderWidth: 1.0,
      direction: Axis.vertical,
      center: Column(
        children: [
          sizedBox(0, 18),
          Text(
            porcent + "%",
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Text(
            label1,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ],
      ),
    ),
  );
}

Widget copyRigthBlack() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      sizedBox(0, 5.0),
      dividerBlack(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('amaszonas 2020   ',
              style: TextStyle(color: ThemeDefault.themeWhite)),
          avatarCircle(IMAGE_LOGO, 15),
        ],
      ),
    ],
  );
}

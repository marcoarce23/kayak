import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neurona/Presentation/Pages/Home/HomePage.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UxGfWidget.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/Service/Constant.dart';

class CustomListTile extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: ThemeDefault.themeWhite,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  icon,
                  Text(
                    text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ]),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  // final prefs = new Preferense();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: boxDecorationMenu(context, IMAGE_LOGO),
          child: Container(
              child: Column(
            children: <Widget>[
              Material(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: avatarCircle(IMAGE_LOGO, 58),
                    // child: ImageOvalNetwork(
                    //     imageNetworkUrl: prefs.avatarImage, //IMAGE_LOGO,
                    //     sizeImage: Size.fromWidth(70)),

                    //  child: showPictureOval(null, IMAGE_SOROJCHI, 70.0),
                  )),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Bienvenido !!!',
                        style: TextStyle(
                            color: ThemeDefault.themeWhite, fontSize: 18.0),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    AutoSizeText(
                      'Usuario: ${'prefs.nameUser'}',
                      style: TextStyle(
                          color: ThemeDefault.themeWhite, fontSize: 16.0),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        CustomListTile(
            FaIcon(FontAwesomeIcons.user, size: 25, color: Colors.blueGrey),
            '   Perfil de Usuario',
            () => navegation(context, HomePage())),
        CustomListTile(
            FaIcon(FontAwesomeIcons.bell, size: 25, color: Colors.purple),
            '   Notificaciones',
            () => navegation(context, HomePage())),
        CustomListTile(
            FaIcon(FontAwesomeIcons.images, size: 25, color: Colors.brown),
            '   Imágenes multimedia',
            () => navegation(context, HomePage())),
        CustomListTile(
            FaIcon(
              FontAwesomeIcons.edit,
              size: 25,
            ),
            '   Crear Imágenes multimedia',
            () => navegation(context, HomePage())),
      ],
    ));
  }
}

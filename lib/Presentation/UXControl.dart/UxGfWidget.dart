import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/getwidget.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';


// Widget showCircle(String porcent, double size, Color color, double completed) {
//   Container(
//     width: size,
//     height: size,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100.0),
//         color: Color.fromRGBO(22, 23, 22, 0.4)),
//   );
//   return Stack(
//     children: <Widget>[
//       // Positioned(top: 90.0, left: 30.0, child: circulo),
//       // Positioned(top: 20.0, right: 30.0, child: circulo),
//       // Positioned(bottom: -50.0, right: -10.0, child: circulo),
//       // Positioned(bottom: 120.0, right: 20.0, child: circulo),
//       // Positioned(bottom: -50.0, left: -20.0, child: circulo),
//       Container(
//         padding: EdgeInsets.only(top: 0.0),
//         child: Column(
//           children: <Widget>[
//             Align(
//               child: RadialProgress(
//                 progressColor: color,
//                 progressBackgroundColor: Colors.yellow,
//                 width: 3,
//                 goalCompleted: completed,
//                 child: Container(
//                     child: Text(porcent,
//                         style: TextStyle(
//                             fontSize: 16, color: AppTheme.themeWhite))),
//               ),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }

// Widget showCircleShimer(
//     String porcent, double size, Color color, double completed) {
//   Container(
//     width: size,
//     height: size,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(110.0),
//         color: Color.fromRGBO(22, 23, 22, 0.4)),
//   );
//   return Stack(
//     children: <Widget>[
//       // Positioned(top: 90.0, left: 30.0, child: circulo),
//       // Positioned(top: 20.0, right: 30.0, child: circulo),
//       // Positioned(bottom: -50.0, right: -10.0, child: circulo),
//       // Positioned(bottom: 120.0, right: 20.0, child: circulo),
//       // Positioned(bottom: -50.0, left: -20.0, child: circulo),
//       Container(
//         padding: EdgeInsets.only(top: 0.0),
//         child: Column(
//           children: <Widget>[
//             Align(
//               child: Shimmer.fromColors(
//                 baseColor: Colors.red,
//                 highlightColor: Colors.blue,
//                 child: RadialProgress(
//                   progressColor: color,
//                   progressBackgroundColor: AppTheme.themeDefault,
//                   width: 5,
//                   goalCompleted: completed,
//                   child: Container(
//                       child: Shimmer.fromColors(
//                           baseColor: Colors.red,
//                           highlightColor: Colors.blue,
//                           child: Text(porcent,
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold)))),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }

// Widget showPictureOval(
//     String porcent, double heigth, Color color, double completed) {
//   Container(
//     width: 60.0,
//     height: 60.0,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(110.0),
//         color: Color.fromRGBO(22, 23, 22, 0.4)),
//   );

//   return Stack(
//     children: <Widget>[
//       // Positioned(top: 90.0, left: 30.0, child: circulo),
//       // Positioned(top: 20.0, right: 30.0, child: circulo),
//       // Positioned(bottom: -50.0, right: -10.0, child: circulo),
//       // Positioned(bottom: 120.0, right: 20.0, child: circulo),
//       // Positioned(bottom: -50.0, left: -20.0, child: circulo),
//       Container(
//         padding: EdgeInsets.only(top: 0.0),
//         child: Column(
//           children: <Widget>[
//             Align(
//               child: RadialProgress(
//                 progressColor: color,
//                 progressBackgroundColor: AppTheme.themeDefault,
//                 width: 5,
//                 goalCompleted: completed,
//                 child: Container(
//                     child: Text(porcent, style: TextStyle(fontSize: 12.5))),
//               ),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }

GFProgressBar gauge() {
  return GFProgressBar(
      type: GFProgressType.circular,
      circleStartAngle: 40,
      percentage: 0.7,
      width: 50,
      radius: 50,
      autoLive: true,
      alignment: MainAxisAlignment.spaceBetween,
      trailing: Text(
        '50%',
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: 15, color: Colors.red),
      ),
      backgroundColor: Colors.black26,
      progressBarColor: GFColors.DANGER);
}
//type: GFProgressType.circular,

GFListTile gfListTileKey(
    Key key,
    Widget title,
    Widget subTitle,
    Widget description,
    FaIcon icon,
    Widget avatar,
    EdgeInsets padding,
    EdgeInsets margin) {
  return GFListTile(
      key: key,
      color: ThemeDefault.themeWhite,
      avatar: avatar,
      title: title,
      subTitle: subTitle,
      description: description,
      padding: padding,
      margin: margin,
      icon: icon);
}

GFListTile gfListTile(Widget title, Widget subTitle, Widget description,
    FaIcon icon, Widget avatar, EdgeInsets padding, EdgeInsets margin) {
  return GFListTile(
      color: Colors.white10,
      avatar: avatar,
      title: title,
      subTitle: subTitle,
      description: description,
      padding: padding,
      margin: margin,
      icon: icon);
}

GFListTile gfListTileText(String title, String subTitle, FaIcon icon,
    Widget avatar, EdgeInsets padding, EdgeInsets margin) {
  return GFListTile(
    color: ThemeDefault.themeWhite,
    avatar: avatar,
    titleText: title,
    subtitleText: subTitle,
    padding: padding,
    margin: margin,
    icon: icon,
  );
}

GFShimmer gfsShimmerWidget(
  Widget widget,
  Color color1,
  Color color2,
  Color color3,
  Color color4,
  Color color5,
) {
  return GFShimmer(
    child: widget,
    showGradient: true,
    showShimmerEffect: true,
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.centerLeft,
      stops: const <double>[0, 0.3, 0.6, 0.9, 1],
      colors: [
        color1,
        color2,
        color3,
        color4,
        color5,
      ],
    ),
  );
}

GFShimmer gfsShimmerText(
  String text,
  double fontSize,
  Color color1,
  Color color2,
  Color color3,
  Color color4,
  Color color5,
) {
  return GFShimmer(
    child: Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
    ),
    showGradient: true,
    showShimmerEffect: true,
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.centerLeft,
      stops: const <double>[0, 0.3, 0.6, 0.9, 1],
      colors: [
        color1,
        color2,
        color3,
        color4,
        color5,
      ],
    ),
  );
}

// GFCard gfCard(String textButton, String textContext, String textTitle,
//     double elevation, Function iconFuction, Function onPressed) {
//   return GFCard(
//     boxFit: BoxFit.cover,
//     image: Image.network(IMAGE_LOGO),
//     elevation: elevation,
//     title: GFListTile(
//         title: Text(textTitle),
//         icon: GFIconButton(
//           onPressed: iconFuction,
//           icon: Icon(Icons.favorite_border),
//           type: GFButtonType.transparent,
//         )),
//     content: Text(textContext),
//     buttonBar: GFButtonBar(
//       alignment: WrapAlignment.start,
//       children: <Widget>[
//         GFButton(
//           onPressed: onPressed,
//           text: textButton,
//         ),
//       ],
//     ),
//   );
// }

// GFCard gfCardAdvanced(
//     String textButton,
//     String textContext,
//     String textTitle,
//     String textSubTitle,
//     double elevation,
//     Widget avatar,
//     Function iconFuction,
//     Function onPressed) {
//   return GFCard(
//     boxFit: BoxFit.cover,
//     image: Image.network(IMAGE_LOGO),
//     border:
//         Border.all(color: Colors.black, width: 2.0, style: BorderStyle.solid),
//     elevation: elevation,
//     title: GFListTile(
//         title: Text(textTitle),
//         subTitle: Text(textSubTitle),
//         avatar: avatar,
//         icon: GFIconButton(
//           onPressed: iconFuction,
//           icon: Icon(Icons.favorite_border),
//           type: GFButtonType.transparent,
//         )),
//     content: Text(textContext),
//     buttonBar: GFButtonBar(
//       alignment: WrapAlignment.start,
//       children: <Widget>[
//         GFButton(
//           onPressed: onPressed,
//           text: textButton,
//         ),
//       ],
//     ),
//   );
// }

// GFAccordion accordion(String title, String content,
//     Color expandedTitlebackgroundColor, Color collapsedTitlebackgroundColor) {
//   return GFAccordion(
//     textStyle: TextStyle(color: Colors.white),
//     title: title,
//     content: content,
//     contentPadding: EdgeInsets.all(5.0),
//     collapsedIcon: Icon(Icons.add, color: AppTheme.themeWhite),
//     expandedIcon: Icon(Icons.minimize, color: AppTheme.themeWhite),
//     expandedTitlebackgroundColor: expandedTitlebackgroundColor,
//     collapsedTitlebackgroundColor: collapsedTitlebackgroundColor,
//     showAccordion: true,
//     titleborder: Border.all(
//         color: AppTheme.themeWhite, width: 0.5, style: BorderStyle.solid),
//     contentBorder: Border.all(
//         color: collapsedTitlebackgroundColor,
//         width: 0.5,
//         style: BorderStyle.none),
//   );
// }

// Widget accordionWidget(
//     Widget title,
//     Widget content,
//     Color expandedTitlebackgroundColor,
//     Color collapsedTitlebackgroundColor,
//     bool isShow) {
//   return Column(
//     children: [
//       GFAccordion(
//         textStyle: TextStyle(color: Colors.black),
//         titleChild: title,
//         contentChild: content,
//         contentPadding: EdgeInsets.all(1),
//         collapsedIcon: Icon(Icons.add, color: AppTheme.themeBlackGrey),
//         expandedIcon: Icon(Icons.minimize, color: AppTheme.themeBlackGrey),
//         expandedTitlebackgroundColor: expandedTitlebackgroundColor,
//         collapsedTitlebackgroundColor: collapsedTitlebackgroundColor,
//         showAccordion: isShow,
//         titleborder: Border.all(
//             color: AppTheme.themeBlackGrey,
//             width: 0.5,
//             style: BorderStyle.solid),
//         contentBorder: Border.all(
//             color: collapsedTitlebackgroundColor,
//             width: 0.5,
//             style: BorderStyle.none),
//       ),
//     ],
//   );
// }

// Widget ranking(double value) {
//   return Container(
//     // width: MediaQuery.of(context).size.width * 0.94,
//     decoration: containerFileds(),
//     child: Row(
//       children: [
//         Text(
//           value.toString(),
//           style: TextStyle(fontSize: 20),
//         ),
//         GFRating(
//           color: Colors.yellow,
//           size: 30,
//           itemCount: value.round(),
//           value: value,
//         ),
//       ],
//     ),
//   );
// }

GFLoader loading() {
  return GFLoader(type: GFLoaderType.circle);
}

GFAvatar avatarSquare(String image, double size) {
  return GFAvatar(
    backgroundImage: NetworkImage(image),
    shape: GFAvatarShape.square,
    size: size,
  );
}

GFAvatar avatarCircle(String image, double size) {
  return GFAvatar(
    backgroundImage: NetworkImage(image),
    backgroundColor: Colors.black,
    foregroundColor: Colors.black,
    shape: GFAvatarShape.circle,
    size: size,
  );
}

GFProgressBar progressCircle(String text, double fontSize) {
  return GFProgressBar(
    type: GFProgressType.circular,
    percentage: 0.5,
    lineHeight: 20,
    child: Padding(
      padding: EdgeInsets.only(right: 5),
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
    ),
    backgroundColor: Colors.black26,
    progressBarColor: GFColors.WARNING,
  );
}

Divider divider() {
  return Divider(
    thickness: 2.0,
    color: ThemeDefault.themeAmarillo,
    endIndent: 20.0,
    indent: 20.0,
  );
}

Divider dividerBlack() {
  return Divider(
    thickness: 2.0,
    color: ThemeDefault.themeWhite,
    endIndent: 20.0,
    indent: 20.0,
  );
}

GFProgressBar progressBar(String text, int type, double fontSize) {
  return GFProgressBar(
    percentage: 0.8,
    lineHeight: 20,
    alignment: MainAxisAlignment.spaceBetween,
    child: Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(fontSize: fontSize, color: Colors.white),
    ),
    leading: Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
    trailing: Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
    backgroundColor: Colors.black26,
    progressBarColor: GFColors.INFO,
  );
}

import 'package:flutter/material.dart';

const String TYPE_RESPONSE_HTTP = "tipo_mensaje";
const String MESSAGE_HTTP = "mensaje";

enum TypeResponse { Ok, Warning, Error }

Future responseMenssageCRUD(
    Future response, GlobalKey<ScaffoldState> scaffold) async {
  await response.then((result) {
    switch (result[TYPE_RESPONSE_HTTP].toString()) {
      case "0":
        final snackbar = SnackBar(
          backgroundColor: Colors.green,
          content: Text(result[MESSAGE_HTTP].toString()),
          duration: Duration(milliseconds: 2500),
        );
        scaffold.currentState.showSnackBar(snackbar);
        break;
      case "1":
        final snackbar = SnackBar(
          backgroundColor: Colors.black,
          content: Text(result[MESSAGE_HTTP].toString()),
          duration: Duration(milliseconds: 2500),
        );
        scaffold.currentState.showSnackBar(snackbar);
        break;
      case "2":
        final snackbar = SnackBar(
          backgroundColor: Colors.yellowAccent,
          content: Text(result[MESSAGE_HTTP].toString(),
              style: TextStyle(
                color: Colors.black,
              )),
          duration: Duration(milliseconds: 2500),
        );
        scaffold.currentState.showSnackBar(snackbar);
        break;
      default:
        final snackbar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(result[MESSAGE_HTTP].toString()),
          duration: Duration(milliseconds: 2500),
        );
        scaffold.currentState.showSnackBar(snackbar);
        break;
    }
  });
}

Future responseMenssage(GlobalKey<ScaffoldState> scaffold,
    TypeResponse typeResponse, String message) async {
  switch (typeResponse) {
    case TypeResponse.Ok:
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
        duration: Duration(milliseconds: 2500),
      );
      scaffold.currentState.showSnackBar(snackbar);
      break;
    case TypeResponse.Warning:
      final snackbar = SnackBar(
        backgroundColor: Colors.black,
        content: Text(message),
        duration: Duration(milliseconds: 2500),
      );
      scaffold.currentState.showSnackBar(snackbar);
      break;
    case TypeResponse.Error:
      final snackbar = SnackBar(
        backgroundColor: Colors.yellowAccent,
        content: Text(message,
            style: TextStyle(
              color: Colors.black,
            )),
        duration: Duration(milliseconds: 2500),
      );
      scaffold.currentState.showSnackBar(snackbar);
      break;
    default:
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        duration: Duration(milliseconds: 2500),
      );
      scaffold.currentState.showSnackBar(snackbar);
      break;
      break;
  }
}

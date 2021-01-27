import 'dart:convert';

import 'package:mime_type/mime_type.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:neurona/service/Constant.dart';
import 'package:neurona/service/StatesHttp.dart';

Future<String> uploadImage(String imagen) async {
  final url = Uri.parse(API_SERVICE_PROJECT_MULTIMEDIA);

  final mimeType = mime(imagen).split('/'); //image/jpeg
  final imageUploadRequest = http.MultipartRequest('POST', url);
  final file = await http.MultipartFile.fromPath('file', imagen,
      contentType: MediaType(mimeType[0], mimeType[1]));

  imageUploadRequest.files.add(file);

  final streamResponse = await imageUploadRequest.send();
  final resp = await http.Response.fromStream(streamResponse);

  return respData(resp);
}

dynamic respData(http.Response resp) {
  if (resp.statusCode != STATUSCODE200) {
    return '${resp.body}';
  }
  final respData = json.decode(resp.body);
  print(respData);
  return respData['secure_url'];
}

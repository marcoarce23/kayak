import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neurona/data/base/BaseEntity.dart';
import 'package:neurona/data/base/StatesEntity.dart';
import 'package:neurona/data/model/example/Empresa.dart';
import 'package:neurona/infrastructure/Repository.dart';
import 'package:neurona/service/Constant.dart';
import 'package:neurona/service/response/ResponseMenssage.dart';

class ServiceEmpresa extends GetxController {
  List<Empresa> listaEmpresa = new List<Empresa>();
  Empresa empresa = new Empresa();

  void devuelveEmpresas() async {
    Empresa x = new Empresa();
    x.apiUrl = API + "/api/Empresa";
    x.stateEntity = StateEntity.Select;
    List<BaseEntity> respuesta = await Repository().getList(x);
    listaEmpresa.clear();
    for (BaseEntity item in respuesta) {
      Empresa p = item;
      listaEmpresa.add(p);
    }
    update();
  }

  void devuelveEmpresaId() async {
    Empresa x = new Empresa();
    x.apiUrl = API + "/api/Empresa/13";
    x.stateEntity = StateEntity.Select;
    Map respuesta = await new Repository().getDataMap(x);
    empresa = new Empresa().fromJson(respuesta['data']);
    update();
  }

  Future<void> registrarEmpresa(
      Empresa empresa, GlobalKey<ScaffoldState> scaffoldKey) async {
    empresa.stateEntity = StateEntity.Insert;
    empresa.idempresa = 0;
    empresa.apiUrl = API + "/api/Empresa";
    Future<dynamic> response = Repository().repository(empresa);
    await responseMenssageCRUD(response, scaffoldKey);
    update();
  }

  Future<void> modificarEmpresa(
      Empresa empresa, GlobalKey<ScaffoldState> scaffoldKey) async {
    empresa.stateEntity = StateEntity.Update;
    empresa.apiUrl = API + "/api/Empresa";
    Future<dynamic> response = Repository().repository(empresa);
    await responseMenssageCRUD(response, scaffoldKey);
    update();
  }

  Future<void> eliminarEmpresa(
      Empresa entidad, GlobalKey<ScaffoldState> _scaffoldKey) async {
    Empresa empresa = Empresa();
    empresa.stateEntity = StateEntity.DeletePhysical;
    empresa.apiUrl = API + "/api/Empresa/" + entidad.idempresa.toString();

    Future<dynamic> response = Repository().repository(empresa);
    await responseMenssageCRUD(response, _scaffoldKey);
    update();
  }
}

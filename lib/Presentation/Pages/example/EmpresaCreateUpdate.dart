import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/data/model/example/Empresa.dart';
import 'package:neurona/service/model/example/ServiceEmpresa.dart';

// ignore: must_be_immutable
class EmpresaCreateUpdate extends StatefulWidget {
  EmpresaCreateUpdate(Empresa entidad) {
    //empresaEditar = entidad;
  }

  @override
  _EmpresaCreateUpdateState createState() => _EmpresaCreateUpdateState();
}

class _EmpresaCreateUpdateState extends State<EmpresaCreateUpdate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  Empresa _empresaEditar;

  Empresa get empresaEditar => _empresaEditar;

  set empresaEditar(Empresa empresaEditar) {
    _empresaEditar = empresaEditar;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: ThemeDefault.themePlomo,
          title:
              Text((empresaEditar == null) ? 'NUEVA EMPRESA' : 'EDITAR EMRPESA',
                  style: TextStyle(
                    color: ThemeDefault.themeAmarillo,
                    fontSize: 16.0,
                  )),
        ),
        key: _scaffoldKey,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormBuilder(
                    key: _fbKey,
                    initialValue: {
                      "empresa":
                          (empresaEditar == null) ? "" : empresaEditar.nombre,
                      "mision":
                          (empresaEditar == null) ? "" : empresaEditar.mision,
                      "vision":
                          (empresaEditar == null) ? "" : empresaEditar.vision,
                      "facebook":
                          (empresaEditar == null) ? "" : empresaEditar.facebook,
                      "whatsapp":
                          (empresaEditar == null) ? "" : empresaEditar.whatsapp,
                    },
                    readOnly: false,
                    child: Column(children: <Widget>[
                      FormBuilderTextField(
                        attribute: "empresa",
                        decoration: InputDecoration(labelText: "Empresa"),
                        validators: [],
                      ),
                      FormBuilderTextField(
                        attribute: "mision",
                        decoration: InputDecoration(labelText: "Mision"),
                        maxLines: 3,
                        validators: [],
                      ),
                      FormBuilderTextField(
                        attribute: "vision",
                        decoration: InputDecoration(labelText: "Vision"),
                        maxLines: 3,
                        validators: [],
                      ),
                      FormBuilderTextField(
                        attribute: "facebook",
                        decoration: InputDecoration(labelText: "Facebook"),
                        maxLines: 2,
                        validators: [],
                      ),
                      FormBuilderTextField(
                        attribute: "whatsapp",
                        decoration: InputDecoration(labelText: "Whatsapp"),
                        validators: [],
                      ),
                    ])),
                GFButton(
                  buttonBoxShadow: true,
                  elevation: 10,
                  onPressed: () {
                    if (_fbKey.currentState.saveAndValidate()) {
                      Empresa empresa = new Empresa();
                      empresa.idempresa =
                          empresaEditar == null ? 0 : empresaEditar.idempresa;
                      empresa.nombre = ((_fbKey
                          .currentState.fields['empresa'].currentState.value
                          .toString()));
                      empresa.mision = ((_fbKey
                          .currentState.fields['mision'].currentState.value
                          .toString()));

                      empresa.vision = ((_fbKey
                          .currentState.fields['vision'].currentState.value
                          .toString()));
                      empresa.facebook = ((_fbKey
                          .currentState.fields['facebook'].currentState.value
                          .toString()));
                      empresa.whatsapp = ((_fbKey
                          .currentState.fields['whatsapp'].currentState.value
                          .toString()));

                      if (empresaEditar == null) {
                        empresa.idempresa = 0;
                        ServiceEmpresa()
                            .registrarEmpresa(empresa, _scaffoldKey);
                      } else {
                        empresa.idempresa = empresaEditar.idempresa;
                        ServiceEmpresa()
                            .modificarEmpresa(empresa, _scaffoldKey);
                      }
                    }
                  },
                  text:
                      (empresaEditar == null) ? "Guardar" : "Editar y guardar",
                  color: ThemeDefault.uiBotonPrimario,
                  textColor: ThemeDefault.uiTextoBoton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

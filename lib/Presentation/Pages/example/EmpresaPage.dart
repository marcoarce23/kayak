import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neurona/Cross/Navigation.dart';
import 'package:neurona/Presentation/Pages/example/EmpresaCreateUpdate.dart';
import 'package:neurona/Presentation/Theme/ThemeDefault.dart';
import 'package:neurona/Presentation/UXControl.dart/UxWidget.dart';
import 'package:neurona/data/model/example/Empresa.dart';
import 'package:neurona/service/model/example/ServiceEmpresa.dart';

class EmpresaListAdm extends StatefulWidget {
  @override
  _EmpresaListAdmState createState() => _EmpresaListAdmState();
}

class _EmpresaListAdmState extends State<EmpresaListAdm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Empresa> listaEmpresa = new List<Empresa>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: Drawer(
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
          ),
          appBar: AppBar(
            elevation: 20,
            backgroundColor: ThemeDefault.themePlomo,
            title: Text('EMPRESAS REGISTRADAS',
                style: TextStyle(
                  color: ThemeDefault.themeAmarillo,
                  fontSize: 16.0,
                )),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                  child: Icon(Icons.menu),
                ),
              ),
            ],
          ),
          key: _scaffoldKey,
          body: Container(
            child: futureEmpresa(context),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navegationToPage(context, EmpresaCreateUpdate(null));
            },
            child: Icon(Icons.add),
            backgroundColor: ThemeDefault.themePlomo,
          )),
    );
  }

  Widget futureEmpresa(BuildContext context) {
    return GetBuilder<ServiceEmpresa>(
        init: ServiceEmpresa(),
        builder: (_) {
          _.devuelveEmpresas();
          return listView(context, _.listaEmpresa);
        });
  }

  Widget listView(BuildContext context, List<Empresa> lista) {
    if (lista.length <= 0) {
      return loadingWidget();
    } else {
      return SingleChildScrollView(
          child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    Empresa entity = lista[index];
                    return Text('hola');
                  })));
    }
  }
}

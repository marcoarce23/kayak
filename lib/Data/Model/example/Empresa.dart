import 'package:neurona/data/base/BaseEntity.dart';

class Empresa extends BaseEntity {
  int idempresa;
  String nombre;
  String mision;
  String vision;
  String facebook;
  String whatsapp;
  //List<Evento> eventos;
  //List<Noticia> noticias;

  Empresa({
    this.idempresa,
    this.nombre,
    this.mision,
    this.vision,
    this.facebook,
    this.whatsapp,
    // this.eventos,
//this.noticias,
  });

  Empresa copyWith({
    int idempresa,
    String nombre,
    String mision,
    String vision,
    String facebook,
    String whatsapp,
    //List<Evento> eventos,
    //List<Noticia> noticias,
  }) =>
      Empresa(
        idempresa: idempresa ?? this.idempresa,
        nombre: nombre ?? this.nombre,
        mision: mision ?? this.mision,
        vision: vision ?? this.vision,
        facebook: facebook ?? this.facebook,
        whatsapp: whatsapp ?? this.whatsapp,
        //  eventos: eventos ?? this.eventos,
        //  noticias: noticias ?? this.noticias,
      );

  Map<String, dynamic> toJson() => {
        "idempresa": idempresa == null ? null : idempresa,
        "nombre": nombre == null ? null : nombre,
        "mision": mision == null ? null : mision,
        "vision": vision == null ? null : vision,
        "facebook": facebook == null ? null : facebook,
        "whatsapp": whatsapp == null ? null : whatsapp,
        //"eventos": eventos == null ? null : eventos,
        // "noticias": noticias == null ? null : noticias,
      };

  fromJson(Map<String, dynamic> json) => new Empresa(
        idempresa: json["idempresa"] == null ? null : json["idempresa"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        mision: json["mision"] == null ? null : json["mision"],
        vision: json["vision"] == null ? null : json["vision"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        //  eventos: json["eventos"] == null
        //         ? null
        //         : List<Evento>.from(
        //             json["eventos"].map((x) => new Evento().fromJson(x))),
        //     noticias: json["noticias"] == null
        //         ? null
        //         : List<Noticia>.from(
        //             json["noticias"].map((x) => new Noticia().fromJson(x))),
      );
}

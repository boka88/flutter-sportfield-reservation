import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Dugovi {
  String valuta;
  String iznosduga;
  String dozvoljeno;

  Dugovi({this.valuta, this.iznosduga, this.dozvoljeno});

  Dugovi.fromJson(Map<String, dynamic> json) {
    valuta = json['valuta'];
    iznosduga = json['iznosduga'];
    dozvoljeno = json['dozvoljeno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valuta'] = this.valuta;
    data['iznosduga'] = this.iznosduga;
    data['dozvoljeno'] = this.dozvoljeno;
    return data;
  }
}

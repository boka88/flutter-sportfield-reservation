import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Novosti {
  String naziv;
  String opis;
  String ostalo;

  Novosti({this.naziv, this.opis, this.ostalo});

  Novosti.fromJson(Map<String, dynamic> json) {
    naziv = json['naziv'];
    opis = json['opis'];
    ostalo = json['ostalo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['naziv'] = this.naziv;
    data['opis'] = this.opis;
    data['ostalo'] = this.ostalo;
    return data;
  }
}

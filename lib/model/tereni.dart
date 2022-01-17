import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Tereni {
  int sifraterena;
  String naziv;

  Tereni({this.sifraterena, this.naziv});

  Tereni.fromJson(Map<String, dynamic> json) {
    sifraterena = json['sifraterena'];
    naziv = json['naziv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sifraterena'] = this.sifraterena;
    data['naziv'] = this.naziv;
    return data;
  }
}

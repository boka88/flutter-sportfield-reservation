import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Osobnipodaci {
  String mjesto;
  String ulicakbr;
  String email;
  String telefon;

  Osobnipodaci({this.mjesto, this.ulicakbr, this.email, this.telefon});

  Osobnipodaci.fromJson(Map<String, dynamic> json) {
    mjesto = json['mjesto'];
    ulicakbr = json['ulicakbr'];
    email = json['email'];
    telefon = json['telefon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mjesto'] = this.mjesto;
    data['ulica_kbr'] = this.ulicakbr;
    data['email'] = this.email;
    data['telefon'] = this.telefon;
    return data;
  }
}

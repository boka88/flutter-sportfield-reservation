import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Otkaz {
  int idbroj;
  int opera;
  String clapre;

  Otkaz({this.idbroj, this.opera, this.clapre});

  Otkaz.fromJson(Map<String, dynamic> json) {
    idbroj = json['idbroj'];
    opera = json['opera'];
    clapre = json['clapre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idbroj'] = this.idbroj;
    data['opera'] = this.opera;
    data['clapre'] = this.clapre;
    return data;
  }
}

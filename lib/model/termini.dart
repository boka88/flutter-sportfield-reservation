import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Termini {
  int sifratermina;
  String satnica;

  Termini({this.sifratermina, this.satnica});

  Termini.fromJson(Map<String, dynamic> json) {
    sifratermina = json['sifratermina'];
    satnica = json['satnica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sifratermina'] = this.sifratermina;
    data['satnica'] = this.satnica;
    return data;
  }
}

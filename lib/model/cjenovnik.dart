import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cjenovnik {
  int sifra;
  String naziv;
  int pdv;
  String mpc;

  Cjenovnik({this.sifra, this.naziv, this.pdv, this.mpc});

  Cjenovnik.fromJson(Map<String, dynamic> json) {
    sifra = json['sifra'];
    naziv = json['naziv'];
    pdv = json['pdv'];
    mpc = json['mpc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sifra'] = this.sifra;
    data['naziv'] = this.naziv;
    data['pdv'] = this.pdv;
    data['mpc'] = this.mpc;
    return data;
  }
}

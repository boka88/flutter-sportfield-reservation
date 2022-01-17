import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Popisrezerviranja {
  String rbr;
  String datum;
  String tereni;
  String termin;
  String protivnik;
  String status;

  Popisrezerviranja(
      {this.rbr,
      this.datum,
      this.tereni,
      this.termin,
      this.protivnik,
      this.status});

  Popisrezerviranja.fromJson(Map<String, dynamic> json) {
    rbr = json['rbr'];
    datum = json['datum'];
    tereni = json['tereni'];
    termin = json['termin'];
    protivnik = json['protivnik'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rbr'] = this.rbr;
    data['datum'] = this.datum;
    data['tereni'] = this.tereni;
    data['termin'] = this.termin;
    data['protivnik'] = this.protivnik;
    data['status'] = this.status;
    return data;
  }
}

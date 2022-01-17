import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Poterenima {
  List<Redovi> redovi;
  String ukupno;

  Poterenima({this.redovi, this.ukupno});

  Poterenima.fromJson(Map<String, dynamic> json) {
    if (json['redovi'] != null) {
      redovi = new List<Redovi>();
      json['redovi'].forEach((v) {
        redovi.add(new Redovi.fromJson(v));
      });
    }
    ukupno = json['ukupno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.redovi != null) {
      data['redovi'] = this.redovi.map((v) => v.toJson()).toList();
    }
    data['ukupno'] = this.ukupno;
    return data;
  }
}

class Redovi {
  String vreme;
  String polje1;
  String polje2;
  String polje3;
  String polje4;
  String polje5;
  String polje6;
  String polje7;
  String polje8;
  String polje9;
  String polje10;
  String polje11;
  String polje12;
  String polje13;

  Redovi(
      {this.vreme,
      this.polje1,
      this.polje2,
      this.polje3,
      this.polje4,
      this.polje5,
      this.polje6,
      this.polje7,
      this.polje8,
      this.polje9,
      this.polje10,
      this.polje11,
      this.polje12,
      this.polje13});

  Redovi.fromJson(Map<String, dynamic> json) {
    vreme = json['vreme'];
    polje1 = json['polje1'];
    polje2 = json['polje2'];
    polje3 = json['polje3'];
    polje4 = json['polje4'];
    polje5 = json['polje5'];
    polje6 = json['polje6'];
    polje7 = json['polje7'];
    polje8 = json['polje8'];
    polje9 = json['polje9'];
    polje10 = json['polje10'];
    polje11 = json['polje11'];
    polje12 = json['polje12'];
    polje13 = json['polje13'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vreme'] = this.vreme;
    data['polje1'] = this.polje1;
    data['polje2'] = this.polje2;
    data['polje3'] = this.polje3;
    data['polje4'] = this.polje4;
    data['polje5'] = this.polje5;
    data['polje6'] = this.polje6;
    data['polje7'] = this.polje7;
    data['polje8'] = this.polje8;
    data['polje9'] = this.polje9;
    data['polje10'] = this.polje10;
    data['polje11'] = this.polje11;
    data['polje12'] = this.polje12;
    data['polje13'] = this.polje13;
    return data;
  }
}

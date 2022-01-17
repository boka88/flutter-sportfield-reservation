import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Podaci {
  int opera;
  String clapre;
  int prava;
  int klusif;
  int nacinpl;
  int jezik;
  String klubbaza;
  String oibcla;
  int dan;
  String nazivdana;
  String datum;

  Podaci(
      {this.opera,
      this.clapre,
      this.prava,
      this.klusif,
      this.nacinpl,
      this.jezik,
      this.klubbaza,
      this.oibcla,
      this.dan,
      this.nazivdana,
      this.datum});

  Podaci.fromJson(Map<String, dynamic> json) {
    opera = json['opera'];
    clapre = json['clapre'];
    prava = json['prava'];
    klusif = json['klusif'];
    nacinpl = json['nacinpl'];
    jezik = json['jezik'];
    klubbaza = json['klubbaza'];
    oibcla = json['oibcla'];
    dan = json['dan'];
    nazivdana = json['nazivdana'];
    datum = json['datum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['opera'] = this.opera;
    data['clapre'] = this.clapre;
    data['prava'] = this.prava;
    data['klusif'] = this.klusif;
    data['nacinpl'] = this.nacinpl;
    data['jezik'] = this.jezik;
    data['klubbaza'] = this.klubbaza;
    data['oibcla'] = this.oibcla;
    data['dan'] = this.dan;
    data['nazivdana'] = this.nazivdana;
    data['datum'] = this.datum;
    return data;
  }
}

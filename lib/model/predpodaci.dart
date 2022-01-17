import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Predpodaci {
  String jadan;
  int rteren;
  int termi3;
  int opera;
  String clapre;
  String satnica;
  String cijena;
  int lmter1;
  String danas;
  int terpi;

  Predpodaci(
      {this.jadan,
      this.rteren,
      this.termi3,
      this.opera,
      this.clapre,
      this.satnica,
      this.cijena,
      this.lmter1,
      this.danas,
      this.terpi});

  Predpodaci.fromJson(Map<String, dynamic> json) {
    jadan = json['jadan'];
    rteren = json['rteren'];
    termi3 = json['termi3'];
    opera = json['opera'];
    clapre = json['clapre'];
    satnica = json['satnica'];
    cijena = json['cijena'];
    lmter1 = json['lmter1'];
    danas = json['danas'];
    terpi = json['terpi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jadan'] = this.jadan;
    data['rteren'] = this.rteren;
    data['termi3'] = this.termi3;
    data['opera'] = this.opera;
    data['clapre'] = this.clapre;
    data['satnica'] = this.satnica;
    data['cijena'] = this.cijena;
    data['lmter1'] = this.lmter1;
    data['danas'] = this.danas;
    data['terpi'] = this.terpi;
    return data;
  }
}

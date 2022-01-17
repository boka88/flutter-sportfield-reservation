import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Pravilnik {
  String pil002;
  String pil003;
  String pil004;
  String pil005;
  String pil006;
  String pil007;
  String pil008;
  String pil009;
  String pil010;
  String pil011;
  String pil012;
  String pil013;
  String pil014;

  Pravilnik(
      {this.pil002,
      this.pil003,
      this.pil004,
      this.pil005,
      this.pil006,
      this.pil007,
      this.pil008,
      this.pil009,
      this.pil010,
      this.pil011,
      this.pil012,
      this.pil013,
      this.pil014});

  Pravilnik.fromJson(Map<String, dynamic> json) {
    pil002 = json['pil002'];
    pil003 = json['pil003'];
    pil004 = json['pil004'];
    pil005 = json['pil005'];
    pil006 = json['pil006'];
    pil007 = json['pil007'];
    pil008 = json['pil008'];
    pil009 = json['pil009'];
    pil010 = json['pil010'];
    pil011 = json['pil011'];
    pil012 = json['pil012'];
    pil013 = json['pil013'];
    pil014 = json['pil014'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pil002'] = this.pil002;
    data['pil003'] = this.pil003;
    data['pil004'] = this.pil004;
    data['pil005'] = this.pil005;
    data['pil006'] = this.pil006;
    data['pil007'] = this.pil007;
    data['pil008'] = this.pil008;
    data['pil009'] = this.pil009;
    data['pil010'] = this.pil010;
    data['pil011'] = this.pil011;
    data['pil012'] = this.pil012;
    data['pil013'] = this.pil013;
    data['pil014'] = this.pil014;
    return data;
  }
}

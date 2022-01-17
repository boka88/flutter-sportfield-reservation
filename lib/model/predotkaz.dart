import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Predotkaz {
  int idbroj;
  int opera;
  String clapre;

  Predotkaz(
      {this.idbroj,
      this.opera,
      this.clapre});

  factory Predotkaz.fromJson(Map<String, dynamic> json) {
    return Predotkaz(
      idbroj: json['idbroj'] as int,
      opera: json['opera'] as int,
      clapre: json['clapre'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idbroj'] = this.idbroj;
    data['opera'] = this.opera;
    data['clapre'] = this.clapre;
    return data;
  }
}

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cjenik {
  String poruka1;
  String poruka2;

  Cjenik({this.poruka1, this.poruka2});

  Cjenik.fromJson(Map<String, dynamic> json) {
    poruka1 = json['poruka1'];
    poruka2 = json['poruka2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poruka1'] = this.poruka1;
    data['poruka2'] = this.poruka2;
    return data;
  }
}

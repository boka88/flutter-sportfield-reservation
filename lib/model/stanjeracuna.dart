import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Stanjeracuna {
  List<Uplate> uplate;
  List<Avansi> avansi;
  List<Rezervacije> rezervacije;
  String saldo;

  Stanjeracuna({this.uplate, this.avansi, this.rezervacije, this.saldo});

  Stanjeracuna.fromJson(Map<String, dynamic> json) {
    if (json['uplate'] != null) {
      uplate = new List<Uplate>();
      json['uplate'].forEach((v) {
        uplate.add(new Uplate.fromJson(v));
      });
    }
    if (json['avansi'] != null) {
      avansi = new List<Avansi>();
      json['avansi'].forEach((v) {
        avansi.add(new Avansi.fromJson(v));
      });
    }
    if (json['rezervacije'] != null) {
      rezervacije = new List<Rezervacije>();
      json['rezervacije'].forEach((v) {
        rezervacije.add(new Rezervacije.fromJson(v));
      });
    }
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uplate != null) {
      data['uplate'] = this.uplate.map((v) => v.toJson()).toList();
    }
    if (this.avansi != null) {
      data['avansi'] = this.avansi.map((v) => v.toJson()).toList();
    }
    if (this.rezervacije != null) {
      data['rezervacije'] = this.rezervacije.map((v) => v.toJson()).toList();
    }
    data['saldo'] = this.saldo;
    return data;
  }
}

class Uplate {
  String rbr;
  String datum;
  String uplaceno;
  String stanje;

  Uplate({this.rbr, this.datum, this.uplaceno, this.stanje});

  Uplate.fromJson(Map<String, dynamic> json) {
    rbr = json['rbr'];
    datum = json['datum'];
    uplaceno = json['uplaceno'];
    stanje = json['stanje'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rbr'] = this.rbr;
    data['datum'] = this.datum;
    data['uplaceno'] = this.uplaceno;
    data['stanje'] = this.stanje;
    return data;
  }
}

class Avansi {
  String rbr;
  String datum;
  String uplaceno;
  String iskoristeno;
  String stanje;

  Avansi({this.rbr, this.datum, this.uplaceno, this.iskoristeno, this.stanje});

  Avansi.fromJson(Map<String, dynamic> json) {
    rbr = json['rbr'];
    datum = json['datum'];
    uplaceno = json['uplaceno'];
    iskoristeno = json['iskoristeno'];
    stanje = json['stanje'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rbr'] = this.rbr;
    data['datum'] = this.datum;
    data['uplaceno'] = this.uplaceno;
    data['iskoristeno'] = this.iskoristeno;
    data['stanje'] = this.stanje;
    return data;
  }
}

class Rezervacije {
  String rbr;
  String datum;
  String teren;
  String termin;
  String cijena;
  String stanje;

  Rezervacije(
      {this.rbr,
      this.datum,
      this.teren,
      this.termin,
      this.cijena,
      this.stanje});

  Rezervacije.fromJson(Map<String, dynamic> json) {
    rbr = json['rbr'];
    datum = json['datum'];
    teren = json['teren'];
    termin = json['termin'];
    cijena = json['cijena'];
    stanje = json['stanje'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rbr'] = this.rbr;
    data['datum'] = this.datum;
    data['teren'] = this.teren;
    data['termin'] = this.termin;
    data['cijena'] = this.cijena;
    data['stanje'] = this.stanje;
    return data;
  }
}

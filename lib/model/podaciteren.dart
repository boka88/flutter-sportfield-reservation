import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Podaciteren {
  String dan1;
  String nazivdana1;
  String dan2;
  String nazivdana2;
  String dan3;
  String nazivdana3;
  String dan4;
  String nazivdana4;
  List<Redovi> redovi;

  Podaciteren(
      {this.dan1,
      this.nazivdana1,
      this.dan2,
      this.nazivdana2,
      this.dan3,
      this.nazivdana3,
      this.dan4,
      this.nazivdana4,
      this.redovi});

  Podaciteren.fromJson(Map<String, dynamic> json) {
    dan1 = json['dan1'];
    nazivdana1 = json['nazivdana1'];
    dan2 = json['dan2'];
    nazivdana2 = json['nazivdana2'];
    dan3 = json['dan3'];
    nazivdana3 = json['nazivdana3'];
    dan4 = json['dan4'];
    nazivdana4 = json['nazivdana4'];
    if (json['redovi'] != null) {
      redovi = new List<Redovi>();
      json['redovi'].forEach((v) {
        redovi.add(new Redovi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dan1'] = this.dan1;
    data['nazivdana1'] = this.nazivdana1;
    data['dan2'] = this.dan2;
    data['nazivdana2'] = this.nazivdana2;
    data['dan3'] = this.dan3;
    data['nazivdana3'] = this.nazivdana3;
    data['dan4'] = this.dan4;
    data['nazivdana4'] = this.nazivdana4;
    if (this.redovi != null) {
      data['redovi'] = this.redovi.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Redovi {
  String vreme;
  List<Polje1> polje1;
  List<Polje2> polje2;
  List<Polje3> polje3;
  List<Polje4> polje4;

  Redovi({this.vreme, this.polje1, this.polje2, this.polje3, this.polje4});

  Redovi.fromJson(Map<String, dynamic> json) {
    vreme = json['vreme'];
    if (json['polje1'] != null) {
      polje1 = new List<Polje1>();
      json['polje1'].forEach((v) {
        polje1.add(new Polje1.fromJson(v));
      });
    }
    if (json['polje2'] != null) {
      polje2 = new List<Polje2>();
      json['polje2'].forEach((v) {
        polje2.add(new Polje2.fromJson(v));
      });
    }
    if (json['polje3'] != null) {
      polje3 = new List<Polje3>();
      json['polje3'].forEach((v) {
        polje3.add(new Polje3.fromJson(v));
      });
    }
    if (json['polje4'] != null) {
      polje4 = new List<Polje4>();
      json['polje4'].forEach((v) {
        polje4.add(new Polje4.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vreme'] = this.vreme;
    if (this.polje1 != null) {
      data['polje1'] = this.polje1.map((v) => v.toJson()).toList();
    }
    if (this.polje2 != null) {
      data['polje2'] = this.polje2.map((v) => v.toJson()).toList();
    }
    if (this.polje3 != null) {
      data['polje3'] = this.polje3.map((v) => v.toJson()).toList();
    }
    if (this.polje4 != null) {
      data['polje4'] = this.polje4.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Polje1 {
  String datum;
  String status;

  Polje1({this.datum, this.status});

  Polje1.fromJson(Map<String, dynamic> json) {
    datum = json['datum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datum'] = this.datum;
    data['status'] = this.status;
    return data;
  }
}

class Polje2 {
  String datum;
  String status;

  Polje2({this.datum, this.status});

  Polje2.fromJson(Map<String, dynamic> json) {
    datum = json['datum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datum'] = this.datum;
    data['status'] = this.status;
    return data;
  }
}

class Polje3 {
  String datum;
  String status;

  Polje3({this.datum, this.status});

  Polje3.fromJson(Map<String, dynamic> json) {
    datum = json['datum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datum'] = this.datum;
    data['status'] = this.status;
    return data;
  }
}

class Polje4 {
  String datum;
  String status;

  Polje4({this.datum, this.status});

  Polje4.fromJson(Map<String, dynamic> json) {
    datum = json['datum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datum'] = this.datum;
    data['status'] = this.status;
    return data;
  }
}

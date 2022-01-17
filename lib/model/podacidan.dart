import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Podacidan {
  List<Kolone> kolone;
  List<Redovi> redovi;

  Podacidan({this.kolone, this.redovi});

  Podacidan.fromJson(Map<String, dynamic> json) {
    if (json['kolone'] != null) {
      kolone = new List<Kolone>();
      json['kolone'].forEach((v) {
        kolone.add(new Kolone.fromJson(v));
      });
    }
    if (json['redovi'] != null) {
      redovi = new List<Redovi>();
      json['redovi'].forEach((v) {
        redovi.add(new Redovi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kolone != null) {
      data['kolone'] = this.kolone.map((v) => v.toJson()).toList();
    }
    if (this.redovi != null) {
      data['redovi'] = this.redovi.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kolone {
  String col;

  Kolone({this.col});

  Kolone.fromJson(Map<String, dynamic> json) {
    col = json['col'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['col'] = this.col;
    return data;
  }
}

class Redovi {
  String vreme;
  List<Polje1> polje1;
  List<Polje2> polje2;
  List<Polje3> polje3;
  List<Polje4> polje4;
  List<Polje5> polje5;
  List<Polje6> polje6;
  List<Polje7> polje7;
  List<Polje8> polje8;
  List<Polje9> polje9;
  List<Polje10> polje10;
  List<Polje11> polje11;
  List<Polje12> polje12;

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
      this.polje12});

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
    if (json['polje5'] != null) {
      polje5 = new List<Polje5>();
      json['polje5'].forEach((v) {
        polje5.add(new Polje5.fromJson(v));
      });
    }
    if (json['polje6'] != null) {
      polje6 = new List<Polje6>();
      json['polje6'].forEach((v) {
        polje6.add(new Polje6.fromJson(v));
      });
    }
    if (json['polje7'] != null) {
      polje7 = new List<Polje7>();
      json['polje7'].forEach((v) {
        polje7.add(new Polje7.fromJson(v));
      });
    }
    if (json['polje8'] != null) {
      polje8 = new List<Polje8>();
      json['polje8'].forEach((v) {
        polje8.add(new Polje8.fromJson(v));
      });
    }
    if (json['polje9'] != null) {
      polje9 = new List<Polje9>();
      json['polje9'].forEach((v) {
        polje9.add(new Polje9.fromJson(v));
      });
    }
    if (json['polje10'] != null) {
      polje10 = new List<Polje10>();
      json['polje10'].forEach((v) {
        polje10.add(new Polje10.fromJson(v));
      });
    }
    if (json['polje11'] != null) {
      polje11 = new List<Polje11>();
      json['polje11'].forEach((v) {
        polje11.add(new Polje11.fromJson(v));
      });
    }
    if (json['polje12'] != null) {
      polje12 = new List<Polje12>();
      json['polje12'].forEach((v) {
        polje12.add(new Polje12.fromJson(v));
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
    if (this.polje5 != null) {
      data['polje5'] = this.polje5.map((v) => v.toJson()).toList();
    }
    if (this.polje6 != null) {
      data['polje6'] = this.polje6.map((v) => v.toJson()).toList();
    }
    if (this.polje7 != null) {
      data['polje7'] = this.polje7.map((v) => v.toJson()).toList();
    }
    if (this.polje8 != null) {
      data['polje8'] = this.polje8.map((v) => v.toJson()).toList();
    }
    if (this.polje9 != null) {
      data['polje9'] = this.polje9.map((v) => v.toJson()).toList();
    }
    if (this.polje10 != null) {
      data['polje10'] = this.polje10.map((v) => v.toJson()).toList();
    }
    if (this.polje11 != null) {
      data['polje11'] = this.polje11.map((v) => v.toJson()).toList();
    }
    if (this.polje12 != null) {
      data['polje12'] = this.polje12.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Polje1 {
  String teren;
  String status;

  Polje1({this.teren, this.status});

  Polje1.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje2 {
  String teren;
  String status;

  Polje2({this.teren, this.status});

  Polje2.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje3 {
  String teren;
  String status;

  Polje3({this.teren, this.status});

  Polje3.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje4 {
  String teren;
  String status;

  Polje4({this.teren, this.status});

  Polje4.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje5 {
  String teren;
  String status;

  Polje5({this.teren, this.status});

  Polje5.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje6 {
  String teren;
  String status;

  Polje6({this.teren, this.status});

  Polje6.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje7 {
  String teren;
  String status;

  Polje7({this.teren, this.status});

  Polje7.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje8 {
  String teren;
  String status;

  Polje8({this.teren, this.status});

  Polje8.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje9 {
  String teren;
  String status;

  Polje9({this.teren, this.status});

  Polje9.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje10 {
  String teren;
  String status;

  Polje10({this.teren, this.status});

  Polje10.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje11 {
  String teren;
  String status;

  Polje11({this.teren, this.status});

  Polje11.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje12 {
  String teren;
  String status;

  Polje12({this.teren, this.status});

  Polje12.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

class Polje13 {
  String teren;
  String status;

  Polje13({this.teren, this.status});

  Polje13.fromJson(Map<String, dynamic> json) {
    teren = json['teren'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teren'] = this.teren;
    data['status'] = this.status;
    return data;
  }
}

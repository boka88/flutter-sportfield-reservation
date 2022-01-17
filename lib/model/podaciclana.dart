import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Podaciclana {
  int sifraClana;
  String username;
  String password;
  String prezimeIme;
  int klubSifra;
  String klubBaza;
  String klubNaziv;
  int godina;
  int jezik;
  int statusClana;
  int pravaPristupa;
  int nacinPlacanja;
  String mjesto;
  String ulicaKbr;
  String email;
  String telefon;
  String tvrtka;
  String sjediste;
  String sjedisteUlica;
  String oib;
  String tvrtkaEmail;
  String bojaPrikaza;
  int sifraCijenePlacanja;
  String grupa;
  String veznaSifra;
  String datumRodjenja;
  int centarPristup;
  int sifraCentra;
  int kategorijaClanstva;
  int predRezervacija;

  Podaciclana(
      {this.sifraClana,
      this.username,
      this.password,
      this.prezimeIme,
      this.klubSifra,
      this.klubBaza,
      this.klubNaziv,
      this.godina,
      this.jezik,
      this.statusClana,
      this.pravaPristupa,
      this.nacinPlacanja,
      this.mjesto,
      this.ulicaKbr,
      this.email,
      this.telefon,
      this.tvrtka,
      this.sjediste,
      this.sjedisteUlica,
      this.oib,
      this.tvrtkaEmail,
      this.bojaPrikaza,
      this.sifraCijenePlacanja,
      this.grupa,
      this.veznaSifra,
      this.datumRodjenja,
      this.centarPristup,
      this.sifraCentra,
      this.kategorijaClanstva,
      this.predRezervacija});

  Podaciclana.fromJson(Map<String, dynamic> json) {
    sifraClana = json['sifra_clana'];
    username = json['username'];
    password = json['password'];
    prezimeIme = json['prezime_ime'];
    klubSifra = json['klub_sifra'];
    klubBaza = json['klub_baza'];
    klubNaziv = json['klub_naziv'];
    godina = json['godina'];
    jezik = json['jezik'];
    statusClana = json['status_clana'];
    pravaPristupa = json['prava_pristupa'];
    nacinPlacanja = json['nacin_placanja'];
    mjesto = json['mjesto'];
    ulicaKbr = json['ulica_kbr'];
    email = json['email'];
    telefon = json['telefon'];
    tvrtka = json['tvrtka'];
    sjediste = json['sjediste'];
    sjedisteUlica = json['sjediste_ulica'];
    oib = json['oib'];
    tvrtkaEmail = json['tvrtka_email'];
    bojaPrikaza = json['boja_prikaza'];
    sifraCijenePlacanja = json['sifra_cijene_placanja'];
    grupa = json['grupa'];
    veznaSifra = json['vezna_sifra'];
    datumRodjenja = json['datum_rodjenja'];
    centarPristup = json['centar_pristup'];
    sifraCentra = json['sifra_centra'];
    kategorijaClanstva = json['kategorija_clanstva'];
    predRezervacija = json['pred_rezervacija'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sifra_clana'] = this.sifraClana;
    data['username'] = this.username;
    data['password'] = this.password;
    data['prezime_ime'] = this.prezimeIme;
    data['klub_sifra'] = this.klubSifra;
    data['klub_baza'] = this.klubBaza;
    data['klub_naziv'] = this.klubNaziv;
    data['godina'] = this.godina;
    data['jezik'] = this.jezik;
    data['status_clana'] = this.statusClana;
    data['prava_pristupa'] = this.pravaPristupa;
    data['nacin_placanja'] = this.nacinPlacanja;
    data['mjesto'] = this.mjesto;
    data['ulica_kbr'] = this.ulicaKbr;
    data['email'] = this.email;
    data['telefon'] = this.telefon;
    data['tvrtka'] = this.tvrtka;
    data['sjediste'] = this.sjediste;
    data['sjediste_ulica'] = this.sjedisteUlica;
    data['oib'] = this.oib;
    data['tvrtka_email'] = this.tvrtkaEmail;
    data['boja_prikaza'] = this.bojaPrikaza;
    data['sifra_cijene_placanja'] = this.sifraCijenePlacanja;
    data['grupa'] = this.grupa;
    data['vezna_sifra'] = this.veznaSifra;
    data['datum_rodjenja'] = this.datumRodjenja;
    data['centar_pristup'] = this.centarPristup;
    data['sifra_centra'] = this.sifraCentra;
    data['kategorija_clanstva'] = this.kategorijaClanstva;
    data['pred_rezervacija'] = this.predRezervacija;
    return data;
  }
}

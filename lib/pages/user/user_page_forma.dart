import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './user_page_menu.dart';
import '../../model/predpodaci.dart';
import './datatable.dart';
import '../globals.dart' as globals;

class UserPageForma extends StatefulWidget {
  final String datum;
  List<dynamic> podaciTabela;
  final String nazivterena;
  final String juzer;
  final String pass;
  final String termin;
  final int teren;
  final int brojtermina;
  final int opera;
  final String clapre;
  final int prava;
  final int klusif;
  final int nacinpl;
  final int jezik;
  final String klubbaza;
  final String oibcla;

  UserPageForma({
    Key key,
    this.datum,
    this.podaciTabela,
    this.nazivterena,
    this.juzer,
    this.pass,
    this.termin,
    this.teren,
    this.brojtermina,
    this.opera,
    this.clapre,
    this.prava,
    this.klusif,
    this.nacinpl,
    this.jezik,
    this.klubbaza,
    this.oibcla,
  }) : super(key: key);

  @override
  _UserPageFormaState createState() => _UserPageFormaState();
}

class _UserPageFormaState extends State<UserPageForma> {
  Future<List<dynamic>> futureItem;

  TextEditingController prezimeime = new TextEditingController();
  TextEditingController sifraclana = new TextEditingController();
  TextEditingController terenbr = new TextEditingController();
  TextEditingController termin = new TextEditingController();
  TextEditingController datum = new TextEditingController();
  TextEditingController cena = new TextEditingController();
  TextEditingController protivnik = new TextEditingController();

  //---------------------------------------------------------------
  Future<List<dynamic>> getPodaciUser() async {
    String bkada = widget.datum.substring(6, 10) +
        "-" +
        widget.datum.substring(3, 5) +
        "-" +
        widget.datum.substring(0, 2);

    String url = globals.strurl +
        "predupis.php?bteren=" +
        widget.teren.toString() +
        "&bsatni=" +
        widget.brojtermina.toString() +
        "&bkada=" +
        bkada +
        "&opera=" +
        widget.opera.toString() +
        "&clapre=" +
        widget.clapre +
        "&prava=" +
        widget.prava.toString() +
        "&klubbaza=" +
        widget.klubbaza +
        "&nacinpl=" +
        widget.nacinpl.toString() +
        "&jezik=" +
        widget.jezik.toString() +
        "&klusif=" +
        widget.klusif.toString();

    //print('url:' + url);

    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      final List<dynamic> responses =
          data.map((j) => new Predpodaci.fromJson(j)).toList();
      //print(responses);

      return responses;
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  @override
  void initState() {
    super.initState();
    futureItem = getPodaciUser();
  }

  //---------------------------------------------------------------
  unesiPodatke() async {
    print("Unesi podatke");
    String url = globals.strurl +
        "upispodataka.php?&rteren=" +
        terenbr.text.toString() +
        "&rsatni=" +
        widget.brojtermina.toString() +
        "&termin=" +
        widget.termin +
        "&danre=" +
        widget.datum +
        "&lmter1=0&terpi=0&cijena=" +
        cena.text +
        "&protiv=" +
        protivnik.text +
        "&opera=" +
        widget.opera.toString() +
        "&clapre=" +
        widget.clapre +
        "&prava=" +
        widget.prava.toString() +
        "&klubbaza=" +
        widget.klubbaza +
        "&nacinpl=" +
        widget.nacinpl.toString() +
        "&jezik=" +
        widget.jezik.toString() +
        "&klusif=" +
        widget.klusif.toString();

    print(url);
    final res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      String unos = data.toString();

      if (unos == "1") {
        print("Unos uspeo");
        _onSelected();
      } else {
        print("Unos nije uspeo");
        //obavesti unos nije uspeo
        //_onSelected();
      }
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  //---------------------------------------------------------------
  _onSelected() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => Datatable(
        podaciTab: widget.podaciTabela,
        teren: widget.teren,
        nazivterena: widget.nazivterena,
        juzer: widget.juzer,
        pass: widget.pass,
        opera: widget.opera,
        clapre: widget.clapre,
        prava: widget.prava,
        klusif: widget.klusif,
        nacinpl: widget.nacinpl,
        jezik: widget.jezik,
        klubbaza: widget.klubbaza,
        oibcla: widget.oibcla,
        stanje: 1,
      ),
    );
    Navigator.of(context).push(route);
  }

  Future gotoHome(context) async {
    /*
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageMenu(
        juzer: widget.juzer,
        podaciTabela: widget.podaciTabela,
        pass: widget.pass,
      ),
    );
    Navigator.of(context).push(route);
    */
  }

  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REZERVACIJA ZA TEREN: " +
            '${widget.nazivterena}' +
            ' ' +
            '${widget.datum}'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  //gotoHome(context);
                },
                child: Icon(
                  Icons.home,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: FutureBuilder(
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              prezimeime.text = widget.clapre;
              sifraclana.text = widget.opera.toString();
              terenbr.text = widget.teren.toString();
              termin.text = widget.termin.toString();
              datum.text = widget.datum;
              cena.text = snapshot.data[0].cijena.toString();
              protivnik.text = '';

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  TextField(
                    controller: prezimeime,
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Ime i prezime',
                    ),
                  ),
                  TextField(
                    controller: terenbr,
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Teren broj',
                    ),
                  ),
                  TextField(
                    controller: termin,
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Termin',
                    ),
                  ),
                  TextField(
                    controller: datum,
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Datum',
                    ),
                  ),
                  TextField(
                    controller: cena,
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Cijena',
                    ),
                  ),
                  TextField(
                    controller: protivnik,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Protivnik',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        unesiPodatke();
                      },
                      child: Text("Potvrdi"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Odustani"),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                child: Text(""),
              );
            }
          }),
    );
  }
}

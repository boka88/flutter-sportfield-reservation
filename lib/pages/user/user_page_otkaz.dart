import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/otkaz.dart';
import './datatable.dart';
import './user_page_porezervacijama.dart';
import '../globals.dart' as globals;

class UserPageOtkaz extends StatefulWidget {
  List<dynamic> podaciTabela;
  final String datum;
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

  UserPageOtkaz({
    Key key,
    this.podaciTabela,
    this.datum,
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
  _UserPageOtkazState createState() => _UserPageOtkazState();
}

class _UserPageOtkazState extends State<UserPageOtkaz> {
  Future<List<dynamic>> futureItem;

  TextEditingController terenbr = new TextEditingController();
  TextEditingController termin = new TextEditingController();
  TextEditingController datum = new TextEditingController();
  TextEditingController razlog = new TextEditingController();
  int kojiindex = 0;
  var razlozi = <String>[
    '',
    'Bad weather',
    'The opponent canceled',
    'Nemogućnost dolaska',
    'Court is not ready',
    'No lighhting',
    'Other'
  ];

  //---------------------------------------------------------------
  Future<List<dynamic>> getPodaciOtkaz() async {
    String bkada = widget.datum.substring(6, 10) +
        "-" +
        widget.datum.substring(3, 5) +
        "-" +
        widget.datum.substring(0, 2);

    String url = globals.strurl +
        "predotkaz.php?bteren=" +
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
    print('predotkaz:' + url);

    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      //print("uhvatio podatke");

      final List<dynamic> responses =
          data.map((j) => new Otkaz.fromJson(j)).toList();
      //print(responses);
      return responses;
    } else {
      //print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  @override
  void initState() {
    super.initState();
    futureItem = getPodaciOtkaz();
  }

  //---------------------------------------------------------------
  obrisiPodatke(String _idbroj) async {
    if (kojiindex > 0) {
      String url = globals.strurl +
          "otkaz.php?&idbroj=" +
          _idbroj +
          "&razod=" +
          kojiindex.toString() +
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
          _onSelected();
        } else {
          print("Otkaz nije uspeo");
        }
      } else {
        //print("nije uhvatio podatke");
        throw Exception('Nema podataka clana');
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
                backgroundColor: Colors.orange,
                title: new Text('Upozorenje'),
                content: new Text(
                    'Obavezno je odabrati razlog otkazivanja rezervacije'),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ));
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

  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otkazivanje rezervacije: " + '${widget.clapre}'),
      ),
      body: FutureBuilder(
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              terenbr.text = widget.teren.toString();
              termin.text = widget.termin.toString();
              datum.text = widget.datum;

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      controller: terenbr,
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Teren broj',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      controller: termin,
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Termin',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      controller: datum,
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Datum',
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 40),
                      child: Text(
                          'Obavezno je odabrati razlog otkazivanja rezervacije',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red))),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      controller: razlog,
                      decoration: InputDecoration(
                        labelText: 'Razlog otkazivanja',
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            razlog.text = value;
                            kojiindex = razlozi.indexOf(value);
                          },
                          itemBuilder: (BuildContext context) {
                            return razlozi
                                .map<PopupMenuItem<String>>((String value) {
                              return new PopupMenuItem(
                                  child: new Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ),
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
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        obrisiPodatke(snapshot.data[0].idbroj.toString());
                      },
                      child: Text("Otkaži rezervaciju"),
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
                        padding: EdgeInsets.all(15),
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

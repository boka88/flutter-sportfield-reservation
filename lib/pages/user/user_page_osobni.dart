import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../globals.dart' as globals;

import '../../model/osobnipodaci.dart';

class UserPageOsobni extends StatefulWidget {
  final String juzer;
  final String pass;
  final int opera;
  final String clapre;
  final int prava;
  final int klusif;
  final int nacinpl;
  final int jezik;
  final String klubbaza;
  final String oibcla;

  UserPageOsobni({
    Key key,
    this.juzer,
    this.pass,
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
  _UserPageOsobniState createState() => _UserPageOsobniState();
}

class _UserPageOsobniState extends State<UserPageOsobni> {
  Future<List<dynamic>> futureItem;

  TextEditingController mjesto = new TextEditingController();
  TextEditingController ulica = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController telefon = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController lozinka = new TextEditingController();
  bool pristajem = true;

  //---------------------------------------------------------------
  Future<List<dynamic>> getPodaciUser() async {
    String url = globals.strurl +
        "predosobnipodaci.php?" +
        "opera=" +
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

    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      final List<dynamic> responses =
          data.map((j) => new Osobnipodaci.fromJson(j)).toList();

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
    var prist = "";
    if (pristajem == true) {
      prist = "1";
    }
    String url = globals.strurl +
        "osobnipodaci.php?" +
        "opera=" +
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
        widget.klusif.toString() +
        "&pristajem=" +
        prist +
        "&oib=" +
        widget.oibcla +
        "&mjesto=" +
        mjesto.text +
        "&ulica=" +
        ulica.text +
        "&email=" +
        email.text +
        "&mobitel=" +
        telefon.text +
        "&novokor=" +
        username.text +
        "&novaloz=" +
        lozinka.text;

    final res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      String unos = data.toString();

      if (unos == "1") {
        unosUspeo();
      } else {
        unosNijeUspeo();
      }
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  //---------------------------------------------------------------
  void unosUspeo() {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.blue,
              title: new Text(' '),
              content: new Text('Podaci su izmjenjeni'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  //---------------------------------------------------------------
  void unosNijeUspeo() {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.red,
              title: new Text('Upozorenje'),
              content: new Text('Podaci nisu izmjenjeni'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OSOBNI PODACI  " + '${widget.clapre}'),
      ),
      body: FutureBuilder(
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              mjesto.text = snapshot.data[0].mjesto;
              ulica.text = snapshot.data[0].ulicakbr;
              email.text = snapshot.data[0].email;
              telefon.text = snapshot.data[0].telefon;
              username.text = widget.juzer;
              lozinka.text = widget.pass;

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: mjesto,
                      textAlign: TextAlign.center,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Mjesto stanovanja',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: ulica,
                      textAlign: TextAlign.center,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Ulica i kućni broj',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: email,
                      textAlign: TextAlign.center,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'E-mail adresa',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: telefon,
                      textAlign: TextAlign.center,
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Telefon/Mobitel',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: username,
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Korisničko ime',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextField(
                      controller: lozinka,
                      enabled: false,
                      obscureText: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Zaporka/Lozinka',
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(
                        "Izjavljujem i potvrđujem da su navedeni podaci ispravni te da se smiju upotrijebiti samo u svrhu rezervacije termina "),
                    value: pristajem,
                    onChanged: (newValue) {
                      setState(() {
                        pristajem = newValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextButton(
                      child: Text('Upiši gornje podatke u evidenciju'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        onSurface: Colors.grey,
                        shadowColor: Colors.red,
                        elevation: 5,
                        padding: const EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        unesiPodatke();
                      },
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

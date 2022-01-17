import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/pravilnik.dart';
import './user_page_menu.dart';
import 'dart:core';
import '../globals.dart' as globals;

class UserPagePravilnik extends StatefulWidget {
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

  UserPagePravilnik({
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
  _UserPagePravilnikState createState() => _UserPagePravilnikState();
}

class _UserPagePravilnikState extends State<UserPagePravilnik> {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;

  Future<List<dynamic>> getPodaciPravilnik() async {
    String url = globals.strurl +
        "pravilnik.php?" +
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
    print(url);
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      final List<dynamic> responses =
          data.map((j) => new Pravilnik.fromJson(j)).toList();
      return responses;
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka pravilnika');
    }
  }

  Future gotoHome(context) async {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => UserPageMenu()));
  }
  //-----------------------------------------------------

//-------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pravilnik"),
      ),
      body: FutureBuilder(
        future: getPodaciPravilnik(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            if (snapshot.data[0].pil002 != null) {
              return Container(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        //height: 50,
                        color: Colors.lightGreen[100],
                        child: Text(snapshot.data[0].pil002)),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil003),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil004),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil005),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil006),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil007),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil008),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil009),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil010),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil011),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil012),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil013),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      color: Colors.amber[500],
                      child: Text(snapshot.data[0].pil014),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Container(
              child: Text("else"),
            );
          }
        },
      ),
    );
  }
}

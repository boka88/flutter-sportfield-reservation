import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/novosti.dart';
import 'dart:core';
import '../globals.dart' as globals;

class UserPageNovosti extends StatefulWidget {
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

  UserPageNovosti({
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
  _UserPageNovostiState createState() => _UserPageNovostiState();
}

class _UserPageNovostiState extends State<UserPageNovosti> {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;

  Future<List<dynamic>> getPodaciNovosti() async {
    String url = globals.strurl +
        "novosti.php?" +
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
          data.map((j) => new Novosti.fromJson(j)).toList();
      return responses;
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka novosti');
    }
  }

//-------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novosti"),
      ),
      body: FutureBuilder(
        future: getPodaciNovosti(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return Container(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      margin: EdgeInsets.only(top: 20),
                      //height: 50,
                      color: Colors.lightGreen[700],
                      child: Text(snapshot.data[0].naziv,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      margin: EdgeInsets.only(top: 20),
                      //height: 50,
                      color: Colors.greenAccent[700],
                      child: Text(snapshot.data[0].opis,
                          style: TextStyle(color: Colors.white))),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      //height: 50,
                      margin: EdgeInsets.only(top: 20),
                      color: Colors.greenAccent[700],
                      child: Text(snapshot.data[0].ostalo,
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            );
          }
          return Center();
        },
      ),
    );
  }
}

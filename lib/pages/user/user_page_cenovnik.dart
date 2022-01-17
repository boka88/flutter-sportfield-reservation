import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/cjenovnik.dart';
import 'dart:core';
import '../globals.dart' as globals;

class UserPageCenovnik extends StatefulWidget {
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

  UserPageCenovnik({
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
  _UserPageCenovnikState createState() => _UserPageCenovnikState();
}

class _UserPageCenovnikState extends State<UserPageCenovnik> {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;

  Future<List<dynamic>> getPodaciCene() async {
    String url = globals.strurl +
        "cjenovnik.php?" +
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
      //print("uhvatio podatke");

      final List<dynamic> responses =
          data.map((j) => new Cjenovnik.fromJson(j)).toList();
      return responses;
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  //-----------------------------------------------------
  _onSelected(String termin, int koji) {
    /*
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageForma(
        dan: widget.dan,
        nazivdana: widget.nazivdana,
        datum: widget.datum,
        termin: termin,
        podaciTabela: tabelaPodaci,
        kojired: koji,
        juzer: widget.juzer,
        pass: widget.pass,
        teren: koji,
        opera: widget.opera,
        clapre: widget.clapre,
        prava: widget.prava,
        klusif: widget.klusif,
        nacinpl: widget.nacinpl,
        jezik: widget.jezik,
        klubbaza: widget.klubbaza,
        oibcla: widget.oibcla,
      ),
    );
    Navigator.of(context).push(route);
    */
  }

  //------------------------------------------------------------------------
  SingleChildScrollView dataBody(List<dynamic> listPodaci) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: [
          DataColumn(
              label: Text("ŠIFRA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("NAZIV",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("MPC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("PDVuMPC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.sifra.toString())),
                DataCell(Text(sale.naziv)),
                DataCell(Text(sale.mpc.toString())),
                DataCell(Text(sale.pdv.toString())),
              ]),
            )
            .toList(),
      ),
    );
  }

//-------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cjenik"),
      ),
      body: FutureBuilder(
        future: getPodaciCene(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: dataBody(snapshot.data)),
                )
              ],
            );
          }
          return Center();
        },
      ),
    );
  }
}

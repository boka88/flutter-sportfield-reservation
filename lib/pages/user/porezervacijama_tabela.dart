import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/popisrezerviranja.dart';
import 'dart:core';
import '../globals.dart' as globals;

class PorezervacijamaTabela extends StatefulWidget {
  final String danod;
  final String dando;
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

  PorezervacijamaTabela({
    Key key,
    this.danod,
    this.dando,
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
  _PorezervacijamaTabelaState createState() => _PorezervacijamaTabelaState();
}

class _PorezervacijamaTabelaState extends State<PorezervacijamaTabela> {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;

  Future<List<dynamic>> getPodaci() async {
    String url = globals.strurl +
        "popisrezerviranja.php?" +
        "danod=" +
        widget.danod +
        "&dando=" +
        widget.dando +
        "&grupica=1" +
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

    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      final List<dynamic> responses =
          data.map((j) => new Popisrezerviranja.fromJson(j)).toList();
      return responses;
    } else {
      print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
  }

  //-----------------------------------------------------
  _onSelected(String termin, int koji) {}

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
              label: Text("Rbr",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "Rbr"),
          DataColumn(
              label: Text("Datum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Tereni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Termin",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Protivnik",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Status",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.rbr)),
                DataCell(
                  Text(sale.datum),
                ),
                DataCell(
                  Text(sale.tereni),
                ),
                DataCell(
                  Text(sale.termin),
                ),
                DataCell(
                  Text(sale.protivnik),
                ),
                DataCell(
                  Text(sale.status),
                ),
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
        title: Text("Pregled po rezervacijama"),
      ),
      body: FutureBuilder(
        future: getPodaci(),
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
                Text(widget.clapre),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: dataBody(snapshot.data)),
                ),
              ],
            );
          }
          return Center();
        },
      ),
    );
  }
}

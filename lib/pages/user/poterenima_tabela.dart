import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/poterenima.dart';
import 'dart:core';
import '../globals.dart' as globals;

class PoterenimaTabela extends StatefulWidget {
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

  PoterenimaTabela({
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
  _PoterenimaTabelaState createState() => _PoterenimaTabelaState();
}

class _PoterenimaTabelaState extends State<PoterenimaTabela> {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;

  Future<List<dynamic>> getPodaci() async {
    String url = globals.strurl +
        "poterenima.php?" +
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
      print("uhvatio podatke");

      final List<dynamic> responses =
          data.map((j) => new Poterenima.fromJson(j)).toList();
      print(responses);
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
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: [
          DataColumn(
              label: Text("Termini",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "Termin"),
          DataColumn(
              label: Text("1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("3",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("4",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("5",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("6",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("7",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("8",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("9",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("D-1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("D-2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("D-3",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("D-4",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.vreme)),
                DataCell(
                  Text(sale.polje1),
                ),
                DataCell(
                  Text(sale.polje2),
                ),
                DataCell(
                  Text(sale.polje3),
                ),
                DataCell(
                  Text(sale.polje4),
                ),
                DataCell(
                  Text(sale.polje5),
                ),
                DataCell(
                  Text(sale.polje6),
                ),
                DataCell(
                  Text(sale.polje7),
                ),
                DataCell(
                  Text(sale.polje8),
                ),
                DataCell(
                  Text(sale.polje9),
                ),
                DataCell(
                  Text(sale.polje10),
                ),
                DataCell(
                  Text(sale.polje11),
                ),
                DataCell(
                  Text(sale.polje12),
                ),
                DataCell(
                  Text(sale.polje13),
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
        title: Text("Pregled po terenima: " + '${widget.clapre}'),
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
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Text('Ukupno: ' + snapshot.data[0].ukupno,
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: dataBody(snapshot.data[0].redovi)),
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

import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/stanjeracuna.dart';
import 'dart:core';
import '../globals.dart' as globals;

class UserPageStanjeracuna extends StatefulWidget {
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

  UserPageStanjeracuna({
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
  _UserPageStanjeracunaState createState() => _UserPageStanjeracunaState();
}

class _UserPageStanjeracunaState extends State<UserPageStanjeracuna>
    with SingleTickerProviderStateMixin {
  List<dynamic> tabelaPodaci;
  int kojiredtabele = 0;
  TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(vsync: this, length: 3);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<List<dynamic>> getPodaci() async {
    String url = globals.strurl +
        "stanjeracuna.php?" +
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
          data.map((j) => new Stanjeracuna.fromJson(j)).toList();
      return responses;
    } else {
      //print("nije uhvatio podatke");
      throw Exception('Nema podataka clana');
    }
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
              label: Text("Rbr",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Datum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("Uplaćeno",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("Stanje",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.rbr)),
                DataCell(Text(sale.datum)),
                DataCell(Text(sale.uplaceno)),
                DataCell(Text(sale.stanje)),
              ]),
            )
            .toList(),
      ),
    );
  }

  //------------------------------------------------------------------------
  SingleChildScrollView dataBody1(List<dynamic> listPodaci) {
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
              tooltip: "1"),
          DataColumn(
              label: Text("DATUM",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("UPLAĆENO",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("ISKORIŠTENO",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("STANJE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.rbr)),
                DataCell(Text(sale.datum)),
                DataCell(Text(sale.uplaceno)),
                DataCell(Text(sale.iskoristeno)),
                DataCell(Text(sale.stanje)),
              ]),
            )
            .toList(),
      ),
    );
  }

  //------------------------------------------------------------------------
  SingleChildScrollView dataBody2(List<dynamic> listPodaci) {
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
              tooltip: "1"),
          DataColumn(
              label: Text("DATUM",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: false,
              tooltip: "1"),
          DataColumn(
              label: Text("TEREN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("TERMIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("CIJENA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
          DataColumn(
              label: Text("STANJE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70)),
              numeric: true,
              tooltip: "1"),
        ],
        rows: listPodaci
            .map(
              (sale) => DataRow(cells: [
                DataCell(Text(sale.rbr)),
                DataCell(Text(sale.datum)),
                DataCell(Text(sale.teren)),
                DataCell(Text(sale.termin)),
                DataCell(Text(sale.cijena)),
                DataCell(Text(sale.stanje)),
              ]),
            )
            .toList(),
      ),
    );
  }

//-------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pregled uplata i plaćanja: " + '${widget.clapre}'),
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(child: Text('Uplate')),
              Tab(child: Text('Avansi')),
              Tab(child: Text('Rezervacije')),
            ],
          ),
        ),
        body: FutureBuilder(
          future: getPodaci(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              return TabBarView(
                controller: _controller,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
                          child: Text(
                              'Stanje računa - Avans Kn ${snapshot.data[1].saldo} ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Uplata članarine',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: dataBody(snapshot.data[0].uplate)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Avansne uplate',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: dataBody1(snapshot.data[0].avansi)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Popis neplaćenih rezervacija',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: dataBody2(snapshot.data[0].rezervacije)),
                        ),
                      ),
                    ],
                  ),

                  /*
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('Avansne uplate',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: dataBody1(snapshot.data[0].avansi)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text('Popis neplaćenih rezervacija',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: dataBody2(snapshot.data[0].rezervacije)),
                    ),
                  ),
                ],
              ),
              */
                ],
              );
            }

            return Center();
          },
        ),
      ),
    );
  }
}

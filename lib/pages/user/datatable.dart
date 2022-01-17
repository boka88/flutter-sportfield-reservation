import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/podaciteren.dart';
import '../../model/termini.dart';
import '../../model/dugovi.dart';
import './user_page_forma.dart';
import './user_page_otkaz.dart';
import './user_page_menu.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import '../globals.dart' as globals;

class Datatable extends StatefulWidget {
  List<dynamic> podaciTab;
  final int teren;
  final String nazivterena;
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
  final int stanje;

  Datatable({
    Key key,
    this.podaciTab,
    this.teren,
    this.nazivterena,
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
    this.stanje,
  }) : super(key: key);

  @override
  _DatatableState createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {
  Future<List<dynamic>> tabelaTerm;
  List<dynamic> tabelatermini = [];
  List<dynamic> tabeladugovi = [];
  String valuta = "Kn";
  //---------------------------------------------------------------
  Future<List<dynamic>> getTermini() async {
    //u ovom prikazu koristi tabelu termini2 iz baze
    String url = globals.strurl +
        "termini2.php?" +
        "sifter=" +
        widget.teren.toString() +
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
          data.map((j) => new Termini.fromJson(j)).toList();
      tabelatermini = responses;
      return responses;
    } else {
      throw Exception('Nema podataka termina');
    }
  }

//---------------------------------------------------------------
  Future<List<dynamic>> getRequest() async {
    String url = globals.strurl +
        "rekreacija_teren.php?sifraterena=" +
        widget.teren.toString() +
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

    final res = await http.get(url);

    if (res.statusCode == 200) {
      try {
        var data = jsonDecode(res.body);
        final List<dynamic> responses =
            data.map((j) => new Podaciteren.fromJson(j)).toList();

        //widget.godina = uzmiGodinu();

        return responses;
      } catch (Exception) {
        print(Exception.toString());
      }
    } else {
      throw Exception('Login neuspesan');
    }
  }

  //-------------------------------------------------------------------------
  Future<List<dynamic>> getDugovanje(String _teren, String _bsatni) async {
    //uzima dugovanje na danasnji dan
    String ddat = _bsatni.substring(6, 10) +
        "-" +
        _bsatni.substring(3, 5) +
        "-" +
        _bsatni.substring(0, 2);
    String url = globals.strurl +
        "rekreacijax2.php?" +
        "bteren=" +
        _teren +
        "&bsatni=" +
        _bsatni +
        "&bkada=" +
        ddat +
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
          data.map((j) => new Dugovi.fromJson(j)).toList();
      tabeladugovi = responses;
      return responses;
    } else {
      throw Exception('Nema podataka dugovanja');
    }
  }

  //-----------------------------------------------------
  String uzmiGodinu() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate.substring(0, 4);
  }

  //-----------------------------------------------------
  void proveriDug(String _termin, String _datum) async {
    double dug = 0.00;
    double dozvoljendug = 0.00;
    try {
      await getDugovanje(widget.teren.toString(), _datum);

      dug = double.parse(tabeladugovi[0].iznosduga);
      dozvoljendug = double.parse(tabeladugovi[0].dozvoljeno);
      valuta = tabeladugovi[0].valuta;

      if (dug < dozvoljendug) {
        _onSelected(_termin, _datum);
      } else {
        String strdug = dug.toStringAsFixed(2);
        String strdozvoljendug = dozvoljendug.toStringAsFixed(2);
        blokirano(strdug, strdozvoljendug);
      }
    } catch (Exception) {
      print(Exception.toString());
    }
  }

//-----------------------------------------------------
  void blokirano(String _dug, String _dozvoljendug) {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.red,
              title: new Text("Upozorenje"),
              content: new Text("Vaš trenutni dug iznosi :" +
                  valuta +
                  " -" +
                  _dug +
                  " Iznos maksimalno dozvoljenog dugovanja je " +
                  valuta +
                  " " +
                  _dozvoljendug +
                  " Vaš dug prelazi dozvoljeni kreditni limit. Rezervacija nije izvršena"),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  //-----------------------------------------------------
  void akcija(String _termin, int _brojterena, int _polje, String _datum) {
    //odredjuje koja ce biti akcija
    switch (_polje) {
      case 0:
        //nema akcije tereni nisu slobodni
        break;
      case 1:
        //slobodan termin
        proveriDug(_termin, _datum);
        break;
      case 2:
        //zauzet teren slika igraca
        break;
      case 4:
        porukaNeMoze();
        //rezervisan teren ne moze da se otkaze
        break;
      case 5:
        //zauzet teren ali moze da se otkaze
        _onSelectedOtkaz(_termin, _datum);
        break;
      case 9:
        //zauzet teren ali moze da se otkaze
        neosvetljenTeren();
        break;
      default:
        //nista
        break;
    }
  }

  //-----------------------------------------------------
  int intTermin(String _termin) {
    //odredjuje koja je sifra termina po satnici
    print('termin:' + _termin);
    int kojasifra = 0;
    int brojtermina = tabelatermini.length;
    int ii = 0;
    for (ii = 0; ii < brojtermina; ii++) {
      if (tabelatermini[ii].satnica == _termin) {
        kojasifra = ii + 1;
      }
    }
    print('kojasifra:' + kojasifra.toString());
    return kojasifra;
  }

//----------------------------------------------------------------------
  void porukaNeMoze() {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.orange,
              title: new Text('Upozorenje'),
              content: new Text(
                  'Vaš rezervirani termin. Rezervaciju nije moguće otkazati zbog isteka vremena za otkazivanje.' +
                      ' Za trošak korištenja se tereti vaš račun.'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

//-----------------------------------------------------------------
  void neosvetljenTeren() {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.orange,
              title: new Text('Upozorenje'),
              content: new Text('Neosvetljen teren.'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  //-----------------------------------------------------
  _onSelected(String termin, String _datum) {
    int inttermin = intTermin(termin);

    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageForma(
        podaciTabela: widget.podaciTab,
        nazivterena: widget.nazivterena,
        datum: _datum,
        termin: termin,
        juzer: widget.juzer,
        pass: widget.pass,
        teren: widget.teren,
        brojtermina: inttermin,
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
  }

  //-----------------------------------------------------
  _onSelectedOtkaz(String termin, String _datum) {
    int inttermin = intTermin(termin);

    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageOtkaz(
        podaciTabela: widget.podaciTab,
        nazivterena: widget.nazivterena,
        datum: _datum,
        termin: termin,
        juzer: widget.juzer,
        pass: widget.pass,
        teren: widget.teren,
        brojtermina: inttermin,
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
  }

  //-----------------------------------------------------
  ImageIcon getIkona(int broj) {
    ImageIcon ikona;
    switch (broj) {
      case 0:
        ikona = new ImageIcon(
          AssetImage("assets/images/zauzettermin.png"),
          color: Color(0xFFe64d3d),
        );
        break;
      case 1:
        ikona = new ImageIcon(
          AssetImage("assets/images/slobodantermin.png"),
          color: Color(0xFF3A5A98),
        );
        break;
      case 2:
        ikona = new ImageIcon(
          AssetImage("assets/images/slobodanteren.png"),
          color: Color(0xFF3A5A98),
        );
        break;
      case 4:
        ikona = new ImageIcon(
          AssetImage("assets/images/igrac.png"),
        );
        break;
      case 5:
        ikona = new ImageIcon(
          AssetImage("assets/images/mojteren.png"),
          color: Color(0xFF3A5A98),
        );
        break;
      case 9:
        ikona = new ImageIcon(
          AssetImage("assets/images/sijalica.png"),
          color: Color(0xFFe64d3d),
        );
        break;
      default:
        ikona = new ImageIcon(
          AssetImage("assets/images/zauzetteren.png"),
          color: Color(0xFFe64d3d),
        );
        break;
    }
    return ikona;
  }

//-------------------------------------------------------------------------------
  DataColumn dataKolona(String _tekst) {
    return DataColumn(
        label: Text(
          _tekst,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        numeric: false,
        tooltip: "1");
  }

//-------------------------------------------------------------------------------
  DataCell dataRedVreme(String _vreme) {
    return DataCell(Text(_vreme));
  }

//-------------------------------------------------------------------------------
  DataCell dataRedPolje(String _vreme, String _datum, String _statuspolja) {
    var brojterena = widget.teren;
    var statuspolja = int.parse(_statuspolja);
    return DataCell(Center(child: getIkona(statuspolja)), onTap: () {
      akcija(_vreme, brojterena, statuspolja, _datum);
    });
  }

//--------------------------------------------------------------------------
  void setStanje() {
    if (widget.stanje == 0) {
      Navigator.pop(context);
    } else {
      idinaMenu();
    }
  }

//--------------------------------------------------------------------------
  void idinaMenu() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageMenu(
        juzer: widget.juzer,
        podaciTabela: widget.podaciTab,
        pass: widget.pass,
      ),
    );
    Navigator.of(context).push(route);
  }

//---------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    getTermini();
  }

//-------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
          onPressed: () {
            setStanje();
          },
        ),
        title: Text("Termini za: " + '${widget.nazivterena}'),
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            //------------------------------------------------------------------
            //int brkolona = 5;
            int brredova = snapshot.data[0].redovi.length;

            print("brredova=" + brredova.toString());
            int ii = 0;
            int jj = 0;

            List<DataRow> myrow = [];
            List<DataCell> celije = [];

            for (ii = 0; ii < brredova; ii++) {
              for (jj = 0; jj < 5; jj++) {
                switch (jj) {
                  case 0:
                    celije.add(dataRedVreme(snapshot.data[0].redovi[ii].vreme));
                    break;
                  case 1:
                    celije.add(dataRedPolje(
                        snapshot.data[0].redovi[ii].vreme,
                        snapshot.data[0].redovi[ii].polje1[0].datum.toString(),
                        snapshot.data[0].redovi[ii].polje1[0].status
                            .toString()));
                    break;
                  case 2:
                    celije.add(dataRedPolje(
                        snapshot.data[0].redovi[ii].vreme,
                        snapshot.data[0].redovi[ii].polje2[0].datum.toString(),
                        snapshot.data[0].redovi[ii].polje2[0].status
                            .toString()));
                    break;
                  case 3:
                    celije.add(dataRedPolje(
                        snapshot.data[0].redovi[ii].vreme,
                        snapshot.data[0].redovi[ii].polje3[0].datum.toString(),
                        snapshot.data[0].redovi[ii].polje3[0].status
                            .toString()));
                    break;
                  case 4:
                    celije.add(dataRedPolje(
                        snapshot.data[0].redovi[ii].vreme,
                        snapshot.data[0].redovi[ii].polje4[0].datum.toString(),
                        snapshot.data[0].redovi[ii].polje4[0].status
                            .toString()));
                    break;
                }
              }
              myrow.add(DataRow(cells: celije));
              celije = [];
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(60.0),
                    border: TableBorder.all(
                        color: Colors.lightGreen,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          new ImageIcon(
                            AssetImage("assets/images/zauzettermin.png"),
                            color: Color(0xFFe64d3d),
                          )
                        ]),
                        Column(children: [
                          new ImageIcon(
                            AssetImage("assets/images/slobodantermin.png"),
                            color: Color(0xFF3A5A98),
                          )
                        ]),
                        Column(children: [
                          new ImageIcon(
                            AssetImage("assets/images/mojteren.png"),
                            color: Color(0xFF3A5A98),
                          )
                        ]),
                        Column(children: [
                          new ImageIcon(AssetImage("assets/images/igrac.png")),
                        ]),
                        Column(children: [
                          new ImageIcon(
                            AssetImage("assets/images/sijalica.png"),
                            color: Color(0xFFe64d3d),
                          )
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('Zauzeto', style: TextStyle(fontSize: 8.0))
                        ]),
                        Column(children: [
                          Text('Slobodno', style: TextStyle(fontSize: 8.0))
                        ]),
                        Column(children: [
                          Text('Vaš termin', style: TextStyle(fontSize: 8.0))
                        ]),
                        Column(children: [
                          Text('Individualno', style: TextStyle(fontSize: 8.0))
                        ]),
                        Column(children: [
                          Text('Neosvetljeno', style: TextStyle(fontSize: 8.0))
                        ]),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        sortColumnIndex: 0,
                        showCheckboxColumn: false,
                        headingRowHeight: 60,
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'TERMIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              ' ' +
                                  snapshot.data[0].dan1.toString() +
                                  '\n' +
                                  ' ' +
                                  snapshot.data[0].nazivdana1,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              ' ' +
                                  snapshot.data[0].dan2.toString() +
                                  '\n' +
                                  ' ' +
                                  snapshot.data[0].nazivdana2,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              ' ' +
                                  snapshot.data[0].dan3.toString() +
                                  '\n' +
                                  ' ' +
                                  snapshot.data[0].nazivdana3,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              ' ' +
                                  snapshot.data[0].dan4.toString() +
                                  '\n' +
                                  ' ' +
                                  snapshot.data[0].nazivdana4,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        rows: myrow,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } //end if
          return Center();
        },
      ),
    );
  }
}

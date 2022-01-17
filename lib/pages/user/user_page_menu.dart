import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import './user_page_cenovnik.dart';
import './user_page_pravilnik.dart';
import './stanjeracuna_oddo.dart';
import './user_page_poterenima.dart';
import './user_page_porezervacijama.dart';
import './user_page_osobni.dart';
import './user_page_novosti.dart';
import './datatable.dart';
import '../../main.dart';
import '../../model/tereni.dart';
import '../globals.dart' as globals;

class UserPageMenu extends StatefulWidget {
  List<dynamic> podaciTabela;
  final String juzer;
  final String pass;

  UserPageMenu({
    Key key,
    this.podaciTabela,
    this.juzer,
    this.pass,
  }) : super(key: key);

  @override
  _UserPageMenuState createState() => _UserPageMenuState();
}

class _UserPageMenuState extends State<UserPageMenu> {
  int opera;
  String clapre;
  int prava;
  int klusif;
  int nacinpl;
  int jezik;
  String klubbaza;
  String oibcla;

  Future<List<dynamic>> getRequest() async {
    List<dynamic> lista = widget.podaciTabela;
    return lista;
  }

  Future<List<dynamic>> getTereni() async {
    opera = widget.podaciTabela[0].opera;
    clapre = widget.podaciTabela[0].clapre;
    prava = widget.podaciTabela[0].prava;
    klusif = widget.podaciTabela[0].klusif;
    nacinpl = widget.podaciTabela[0].nacinpl;
    jezik = widget.podaciTabela[0].jezik;
    klubbaza = widget.podaciTabela[0].klubbaza;
    oibcla = widget.podaciTabela[0].oibcla;

    String url = globals.strurl +
        "tereni.php?" +
        "&opera=" +
        opera.toString() +
        "&clapre=" +
        clapre +
        "&prava=" +
        prava.toString() +
        "&klubbaza=" +
        klubbaza +
        "&nacinpl=" +
        nacinpl.toString() +
        "&jezik=" +
        jezik.toString() +
        "&klusif=" +
        klusif.toString();

    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);

      final List<dynamic> responses =
          data.map((j) => new Tereni.fromJson(j)).toList();
      return responses;
    } else {
      throw Exception('Nema podataka termina');
    }
  }

  _onSelected(int sifraterena, String naziv) {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => Datatable(
        podaciTab: widget.podaciTabela,
        teren: sifraterena,
        nazivterena: naziv,
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
        stanje: 0,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedCijene() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageCenovnik(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedNovosti() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageNovosti(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedOsob() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageOsobni(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedStanjeracuna() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => StanjeracunaOdDo(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedPoterenima() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPagePoterenima(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedPorezervacijama() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPagePorezervacijama(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedOdjava() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => MyApp(),
    );
    Navigator.of(context).push(route);
  }

  _onSelectedPravilnik() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPagePravilnik(
        juzer: widget.juzer,
        pass: widget.pass,
        opera: opera,
        clapre: clapre,
        prava: prava,
        klusif: klusif,
        nacinpl: nacinpl,
        jezik: jezik,
        klubbaza: klubbaza,
        oibcla: oibcla,
      ),
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
      ),
      drawer: draw(),
      body: FutureBuilder(
        future: getTereni(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            return ListView.separated(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].naziv,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _onSelected(
                          snapshot.data[index].sifraterena,
                          snapshot.data[index].naziv,
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  Widget draw() => Container(
        width: 280,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                width: 180,
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Text('SB'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('username@user.com'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                title: Text('Pregledi'),
                children: <Widget>[
                  ListTile(
                    title: Text(' Cijenik'),
                    onTap: () {
                      _onSelectedCijene();
                    },
                    //tileColor: Colors.blue,
                  ),
                  ListTile(
                    title: Text(' Novosti'),
                    onTap: () {
                      _onSelectedNovosti();
                    },
                    //tileColor: Colors.blue,
                  ),
                  Divider(),
                  ListTile(
                    title: Text(' Stanje racuna'),
                    onTap: () {
                      _onSelectedStanjeracuna();
                    },
                    //tileColor: Colors.blue,
                  ),
                  Divider(),
                  ListTile(
                    title: Text(' Pregledi po rezervacijama'),
                    onTap: () {
                      _onSelectedPorezervacijama();
                    },
                    //tileColor: Colors.blue,
                  ),
                  ListTile(
                    title: Text(' Pregled po terenima'),
                    onTap: () {
                      _onSelectedPoterenima();
                    },
                    //tileColor: Colors.blue,
                  ),
                  ListTile(
                    title: Text(' Moji rezultati'),
                    onTap: () {
                      _onSelectedOsob();
                    },
                    //tileColor: Colors.blue,
                  ),
                ],
              ),
              ListTile(
                title: Text('Popis po imenima'),
                //tileColor: Colors.blue,
              ),
              Divider(
                thickness: 1,
              ),
              ExpansionTile(
                title: Text(
                  'Profil',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.blue,
                children: <Widget>[
                  ListTile(
                    title: Text('  Osobni podaci',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      _onSelectedOsob();
                    },
                    //tileColor: Colors.blue,
                  ),
                  ListTile(
                    title: Text('  Pravilnik',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onTap: () {
                      _onSelectedPravilnik();
                    },
                  ),
                  ListTile(
                    title: Text('  Pomoc',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    //tileColor: Colors.blue,
                  ),
                ],
              ),
              ListTile(
                title: Text('Odjava'),
                //tileColor: Colors.blue,
                onTap: () {
                  _onSelectedOdjava();
                },
              ),
            ],
          ),
        ),
      );
}

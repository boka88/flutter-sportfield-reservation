import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/podaci.dart';
import 'user/user_page_menu.dart';
import 'globals.dart' as globals;

class FirstPage extends StatefulWidget {
  FirstPage({
    Key key,
  }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var client = http.Client();

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List<dynamic>> getRequest() async {
    String url = globals.strurl +
        "getdata.php?username=" +
        user.text +
        "&passwd=" +
        pass.text;

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        if (data.toString() == "0") {
          nijeprosaoLogin('Prijava neuspješna',
              'Korisničko ime i zaporka se ne podudaraju');
        } else {
          try {
            final List<dynamic> responses =
                data.map((j) => new Podaci.fromJson(j)).toList();
            prosaoLogin(responses);
            return responses;
          } catch (Exception) {
            print(Exception.toString());
            nijeprosaoLogin('Obavijest', 'Podaci sa servera nisu u redu');
          }
        }
      } else {
        nijeprosaoLogin('Obavijest', 'Odgovor sa servera nije validan');
      }
    } catch (XMLHttpRequestException) {
      nijeprosaoLogin(
          'Obavijest',
          'Provjerite Internet konekciju:' +
              XMLHttpRequestException.toString());
    }
  }

//---------------------------------------------------------------------
  void nijeprosaoLogin(String msg1, String msg2) {
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.red,
              title: new Text(msg1),
              content: new Text(msg2),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

//---------------------------------------------------------------------
  void prosaoLogin(List<dynamic> flag) {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageMenu(
        juzer: user.text,
        podaciTabela: flag,
        pass: pass.text,
      ),
    );
    Navigator.of(context).push(route);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Prijavi se'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Korisničko ime',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(hintText: ''),
                ),
              ),
              Text(
                'Zaporka',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(hintText: ''),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                height: 120,
                child: TextButton(
                  child: Text('Prijava u sustav'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    onSurface: Colors.blue,
                    shadowColor: Colors.red,
                    elevation: 5,
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    getRequest();
                  },
                ),
              ),
              Text(
                msg,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './user_page_stanjeracuna.dart';

class StanjeracunaOdDo extends StatefulWidget {
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
  StanjeracunaOdDo({
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
  _StanjeracunaOdDoState createState() => _StanjeracunaOdDoState();
}

class _StanjeracunaOdDoState extends State<StanjeracunaOdDo> {
  DateTime _selectedDate;

  TextEditingController danod = new TextEditingController();
  TextEditingController dando = new TextEditingController();

  String msg = '';

  void neispravnaPolja() {
    print("dijalog");
    showDialog(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
              backgroundColor: Colors.orange,
              title: new Text('Upozorenje'),
              content: new Text('Popunite datume'),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  void getRequest() {
    //print("getRequest");
    if (danod.text.length > 0 && dando.text.length > 0) {
      _onSelected();
    } else {
      print("neispravnaPolja");
      neispravnaPolja();
    }
    //print(danod.text.length.toString() + " " + dando.text.length.toString());
  }

  _onSelected() {
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => UserPageStanjeracuna(
        danod: danod.text,
        dando: dando.text,
        juzer: widget.juzer,
        pass: widget.pass,
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stanje računa   ' + '${widget.clapre}'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('',
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              Text(
                'Od datuma',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  controller: danod,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              Text(
                'Do datuma',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: dando,
                  onTap: () {
                    _selectDate1(context);
                  },
                ),
              ),
              TextButton(
                child: Text('OK'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueGrey,
                  onSurface: Colors.grey,
                  shadowColor: Colors.red,
                  elevation: 5,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  getRequest();
                },
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

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      danod
        ..text = DateFormat('dd.MM.yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: danod.text.length, affinity: TextAffinity.upstream));
    }
  }

  _selectDate1(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dando
        ..text = DateFormat('dd.MM.yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dando.text.length, affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

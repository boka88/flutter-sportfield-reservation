import 'package:flutter/material.dart';

class Prednosti extends StatefulWidget {
  @override
  _PrednostiState createState() => _PrednostiState();
}

class _PrednostiState extends State<Prednosti> {
  Widget _buildKluboviCard() => Card(
      shadowColor: Colors.black,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(24),
      // ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(4),
        //margin: EdgeInsets.all(14.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Color(0xffe9ecef),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Za klubove',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Usluga dostupna 7 dana / 24 sata',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Online rezervacija sa računala ili mobitela',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Jednostavno administriranje sustavom',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Brza naplata i izdavanje računa',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Automatsko financijsko praćenje',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Brza rezervacija više terena',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Brza rezervacija za duži period',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Evidencija članstva i članarine',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Online unos novosti u radu kluba',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Slanje pozivnica članovima mailom',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Statističko praćenje rezervacija',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Mjesečni računi za članove i tvrtke',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Last minute rezervacije',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Neograničeni broj članova i terena',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Storniranje i otkazivanje terena',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Naknadna naplata terena',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ));

  Widget _buildClanoviCard() => Card(
      shadowColor: Colors.black,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(24),
      // ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(4),
        //margin: EdgeInsets.all(14.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Color(0xffe9ecef),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Za članove',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Jednostavno korištenje',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Brzi uvid u rezervacije',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Rezerviranje jednim klikom',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Više načina plaćanja rezervacija',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Pregled vlastitih rezerviranja',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Administracija vlastitih podataka',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Pregled troškova rezerviranja',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Razmjena poruka među članovima',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Uvid u novosti kluba',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Uvid u cjenik kluba',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),                 
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xffe9ecef),
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Prednosti Sportbooking sustava za rezervacije terena',
                  style: TextStyle(fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              //child: _buildListPanel(),
              child: _buildKluboviCard(),
            ),
            Container(
              //child: _buildListPanel(),
              child: _buildClanoviCard(),
            ),
          ],
        ),
      ),
    );
  }}

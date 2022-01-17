import 'dart:io';

import 'package:flutter/material.dart';

class Cjenik extends StatefulWidget {
  @override
  _CjenikState createState() => _CjenikState();
}

class _CjenikState extends State<Cjenik> {
  //List<Item> _data = generateItem(2);

  // Widget buildTroskoviCard() => Card(
  //     shadowColor: Colors.black,
  //     elevation: 8,
  //     clipBehavior: Clip.antiAlias,
  //     // shape: RoundedRectangleBorder(
  //     //   borderRadius: BorderRadius.circular(24),
  //     // ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           colors: [Colors.white, Colors.white],
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //         ),
  //       ),
  //       padding: EdgeInsets.all(4),
  //       //margin: EdgeInsets.all(14.0),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  //           //mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Container(
  //               color: Color(0xffe9ecef),
  //               width: double.infinity,
  //               child: Center(
  //                 child: Text(
  //                   'Ostali troskovi koristenja',
  //                   style: TextStyle(
  //                     fontSize: 22,
  //                     color: Colors.blue,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak web-servera - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak baze - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak programskih licenci - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak instalacije - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak održavanja sustava - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak arhiviranja podataka - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak nadogradnje sustava - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak prilagodbe Vašem klubu - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak obuke administratora - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                       Container(
  //                         //alignment: Alignment(-0.3,-0.3),
  //                         height: 30,
  //                         color: Colors.white,
  //                         child: Text(
  //                           'Trošak internetskog prometa - € 0.00',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ]),
  //     ));

  Widget _buildTroskoviCard() => Card(
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
                    'Ostali troškovi korištenja',
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
                            'Trošak web-servera - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak baze - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak programskih licenci - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak instalacije - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak održavanja sustava - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak arhiviranja podataka - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak nadogradnje sustava - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak prilagodbe Vašem klubu - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak obuke administratora - € 0.00',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Trošak internetskog prometa - € 0.00',
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

  Widget _buildPogodnostiCard() => Card(
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
                    'Ostale pogodnosti',
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
                            'Ugovor bez klauzule trajanja',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Neograničen broj članova',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Nema dodatnih troškova',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Minimalani troškovi najma',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Online podrška korisnicima',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Besplatna nadogradnja sustava',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Eliminacija 99% telefonskih poziva',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Eliminacija papirnog vođenja',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Eliminacija dvostrukog rezerviranja',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          //alignment: Alignment(-0.3,-0.3),
                          height: 30,
                          color: Colors.white,
                          child: Text(
                            'Dosadašnje zadovoljstvo korisnika',
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
                  'MJESEČNA NAKNADA - E 8 ( + pdv ) PO TERENU',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              //child: _buildListPanel(),
              child: _buildTroskoviCard(),
            ),
            Container(
              //child: _buildListPanel(),
              child: _buildPogodnostiCard(),
            ),
          ],
        ),
      ),
    );
  }
}

// class Item {
//   String expandedValue;
//   String headerValue;
//   bool isExpanded;

//   Item({this.expandedValue, this.headerValue, this.isExpanded = false});
// }

// List<Item> generateItem(int numberOfItems) {
//   return List.generate(numberOfItems, (index) {
//     if (index == 0) {
//       return Item(
//         // headerValue: 'Panel $index',
//         // expandedValue: 'This is item number $index',
//         headerValue: 'Ostali troskovi koristenja',
//         expandedValue: 'This is item number $index',
//       );
//     } else {
//       return Item(
//         // headerValue: 'Panel $index',
//         // expandedValue: 'This is item number $index',
//         headerValue: 'Ostale pogodnosti',
//         expandedValue: 'This is item number $index',
//       );
//     }
//   });
// }

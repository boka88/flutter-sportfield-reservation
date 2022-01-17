// import 'package:flutter/material.dart';

// class SideDrawer extends StatefulWidget {
//   @override
//   _SideDrawerState createState() => _SideDrawerState();
// }

// class _SideDrawerState extends State<SideDrawer> {
//   int opera;
//   String clapre;
//   int prava;
//   int klusif;
//   int nacinpl;
//   int jezik;
//   String klubbaza;
//   String oibcla;

//   Future<List<dynamic>> getRequest() async {
//     List<dynamic> lista = widget.podaciTabela;
//     return lista;
//   }
//   _onSelectedRez() {
//     var route = new MaterialPageRoute(
//       builder: (BuildContext context) => UserPage(
//         juzer: widget.juzer,
//         pass: widget.pass,
//         podaciTabela: widget.podaciTabela,
//       ),
//     );
//     Navigator.of(context).push(route);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       child: Drawer(
//         child: ListView(
//           children: <Widget>[
//             Container(
//               width: 180,
//               height: 120,
//               child: DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.blue[100],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //crossAxisAlignment: CrossAxisAlignment.baseline,
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           // radius: 40.0,
//                           // maxRadius: 20.0,
//                           child: Text('SB'),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('username@user.com'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('Rezervacija terena'),
//               //tileColor: Colors.blue,
//             ),
//             ExpansionTile(
//               title: Text('Pregledi'),
//               children: <Widget>[
//                 ListTile(
//                   title: Text(' Cijenik'),
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => TereniProba()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text(' Novosti'),
//                   onTap: () {
//                     //Navigator.of(context).pushReplacementNamed('/');
//                     //  Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => ProbaPage()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Text(' Stanje racuna'),
//                   onTap: () {
//                     //  Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => StanjeRacuna()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Text(' Pregledi po rezervacijama'),
//                   onTap: () {
//                     //  Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => PreglediRezervacije()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text(' Pregled po terenima'),
//                   onTap: () {
//                     //   Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => PregledTereni()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text(' Moji rezultati'),
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => MojiRezultati()),
//                     // );
//                   },
//                   //tileColor: Colors.blue,
//                 ),
//               ],
//             ),
//             ListTile(
//               title: Text('Popis po imenima'),
//               //tileColor: Colors.blue,
//             ),
//             Divider(
//               thickness: 1,
//             ),
//             ExpansionTile(
//               title: Text(
//                 'Profil',
//                 style: TextStyle(color: Colors.black),
//               ),
//               backgroundColor: Colors.blue,
//               children: <Widget>[
//                 ListTile(
//                   title: Text('  Osobni podaci'),
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text(' Pomoc'),
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text('  Pravilnik'),
//                   //tileColor: Colors.blue,
//                 ),
//                 ListTile(
//                   title: Text('  Odjava'),
//                   //tileColor: Colors.blue,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }
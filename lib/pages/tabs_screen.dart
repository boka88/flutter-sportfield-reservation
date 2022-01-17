import 'package:flutter/material.dart';

import './prva/login.dart';
import './prva/cjenik.dart';
import './prva/prednosti.dart';
import './prva/kontakt.dart';

import 'first_page.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': FirstPage(), 'title': 'SportBooking'},
    {'page': Cjenik(), 'title': 'Cjenik'},
    {'page': Prednosti(), 'title': 'Prednosti'},
    {'page': Kontakt(), 'title': 'Kontakt'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image(image: AssetImage('assets/images/logo.png')),
            Text(' SPORTBOOKING')
          ],
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Colors.white,
        //unselectedItemColor: Color(0xff1C5D99),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        // selectedFontSize: 3,
        // unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            // ignore: deprecated_member_use
            title: Text(
              'Login',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Cjenik',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text(
              'Prednosti',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text(
              'Kontakt',
            ),
          ),
        ],
      ),
    );
  }
}

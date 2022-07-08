import 'package:campostconnect/Home_Tab/transaction.dart';
import 'package:flutter/material.dart';

import 'Home_Screen/HomeScreen.dart';
import 'add_new_Screen.dart';
import 'card_screen.dart';
import 'Mobile_Money_Screen/mobile_money.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 3;
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    super.initState();

    _pages = [
      {'pages': HomeScreen()},
      {'pages': TransactionScreen()},
      {'pages': AddNewScreen()},
      {'pages': MobileMoneyScreen()},
      {'pages': CardScreen()},
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _pages[_selectedIndex]['pages'] as Widget,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _selectedIndex,
          iconSize: 30,
          unselectedItemColor: Colors.black38,
          onTap: _selectPage,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Home.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/transaction.png')),
                label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle,
                    size: 60, color: Theme.of(context).primaryColor),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/mobile_money.png')),
                label: 'Mobile Money'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/Cards.png')),
                label: 'Cards')
          ],
        ));
  }
}

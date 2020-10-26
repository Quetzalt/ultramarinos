import 'package:flutter/material.dart';
import 'package:lamp_bottom_navigation/lamp_bottom_navigation.dart';

import 'package:ultramarinos/src/pages/paginasMenu/productosPage.dart';
import 'package:ultramarinos/src/pages/paginasMenu/proveedorPage.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  PageController _pageController;
  int _page = 0;

  void _navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          ProductosPage(),
          ProveedorPage(),
        ],
      ),
      bottomNavigationBar: LampBottomNavigationBar(
        items: <IconData>[
          Icons.account_balance_wallet,
          Icons.people,
          Icons.calendar_today,
          Icons.monetization_on,
          Icons.supervised_user_circle,
        ],
        width: double.infinity,
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}

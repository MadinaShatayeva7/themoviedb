import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_screen/movie_screen_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidget createState() {
    return _MainScreenWidget();
  }
}

class _MainScreenWidget extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static List<Widget> _widgetTabs = <Widget>[];

  void onselectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TMDB')),
      body: IndexedStack(
        index: _selectedTab,
        children: [
        Text(
          'Главная',
        ),
        MovieScreen(),
        Text(
          'Сериалы',
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Сериалы',
          ),
        ],
        onTap: onselectedTab,
      ),
    );
  }
}

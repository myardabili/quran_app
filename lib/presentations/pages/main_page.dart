import 'package:flutter/material.dart';
import 'package:quran_app/common/constans/images.dart';
import 'package:quran_app/presentations/pages/home_page.dart';
import 'package:quran_app/presentations/pages/prayer_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const PrayerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.iconQuran,
              height: 32,
              width: 32,
            ),
            activeIcon: Image.asset(
              AppImages.iconQuranSelected,
              height: 32,
              width: 32,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImages.iconPrayer,
              height: 32,
              width: 32,
            ),
            activeIcon: Image.asset(
              AppImages.iconPrayerSelected,
              height: 32,
              width: 32,
            ),
            label: 'Prayer',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

// ignore_for_file: file_names
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shark/config/colors.dart';
import 'package:shark/screens/entry.dart';
import 'package:shark/screens/outstading.dart';
import 'package:shark/screens/settled.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int _currentIndex = 0;
  //tabs in the app
  List<Widget> tabs = [
    const OutstandingLoans(),
    const LoanEntry(),
    const SettledLoans()
  ];
  List title = ['Outstanding Loans', 'Loanee details', 'Settled Loans'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: Center(child: Text(title[_currentIndex])),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: themeColor,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.payments_outlined),
            title: const Text('Outstanding Loans'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_box),
            title: const Text('New Entry'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.done_outline_rounded),
            title: const Text('Settled Loans'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

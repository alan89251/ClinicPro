import 'package:clinic_pro/components/modal/filter_modal.dart';
import 'package:clinic_pro/screens/add_patient_screen.dart';
import 'package:clinic_pro/screens/overview_screen.dart';
import 'package:clinic_pro/screens/search_screen.dart';
import 'package:clinic_pro/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const OverviewScreen(),
    const SearchScreen(),
    const AddPatientScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Styles.primaryGreenColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/icons/Home_inactive.png'),
                  width: 18,
                  height: 18,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/icons/Home_active.png'),
                  width: 18,
                  height: 18,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/icons/search_inactive.png'),
                  width: 18,
                  height: 18,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/icons/search_active.png'),
                  width: 18,
                  height: 18,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('assets/icons/plus_inactive.png'),
                  width: 18,
                  height: 18,
                ),
                activeIcon: Image(
                  image: AssetImage('assets/icons/plus_active.png'),
                  width: 18,
                  height: 18,
                ),
                label: "Add")
          ],
        ),
      ),
    );
  }
}

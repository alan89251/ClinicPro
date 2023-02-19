import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/gret_divider.dart';
import '../components/overview_screen/patient_display_box.dart';
import '../utils/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Search", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor))),
          ),
          const GreyDivider(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/icons/searchBar.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'First Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/icons/searchBar.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/icons/searchBar.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'ID',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Styles.primaryGreenColor),
                      child: const Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
                )
              ],
            ),
          ),
          const Gap(20),
          const GreyDivider(),
          Expanded(
              child: ListView(
                children: [
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                  PatientDisplayBox(),
                ],
              ))
        ],
      ),
    );
  }
}

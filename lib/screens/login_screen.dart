import 'package:clinic_pro/screens/bottom_bar.dart';
import 'package:clinic_pro/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        children: [
          const Gap(140),
          Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Styles.primaryGreenColor),
                  ),
                  child: Image.asset('assets/icons/icons8-clinic.png')),
              const Gap(20),
              Text(
                "Clinic Pro",
                style: Styles.headlineStyle3,
              )
            ],
          ),
          const Gap(150),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFF4F6FD)),
                child: const TextField(
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  decoration:
                      InputDecoration(border: InputBorder.none, hintText: 'Your Access Code', contentPadding: EdgeInsets.all(10)),
                ),
              ),
              const Gap(40),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,'/overview');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Styles.primaryGreenColor),
                    child: const Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
              )
            ],
          )
        ],
      ),
    );
  }
}

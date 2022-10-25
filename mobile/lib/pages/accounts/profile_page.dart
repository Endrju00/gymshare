import 'package:flutter/material.dart';
import 'package:gymshare/settings/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 40, color: primaryTextColor),
        ),
      )),
    );
  }
}

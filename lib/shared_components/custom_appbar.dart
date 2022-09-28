import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar buildCustomAppBar(BuildContext context) {
    return AppBar(
      elevation: 25,
      shadowColor: Colors.amber,
      title: const Text(
        'Sol Ventus',
        style:
            TextStyle(fontFamily: 'SpecialElite', fontWeight: FontWeight.w900),
      ),
      actions: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.info,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

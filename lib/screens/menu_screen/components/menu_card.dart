import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.cardText,
    required this.cardImageAssetString,
    required this.buttonCallBack,
  }) : super(key: key);

  final String cardText;
  final String cardImageAssetString;
  final void Function()? buttonCallBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonCallBack,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 150,
        height: 220,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.amber,
              offset: Offset(1.0, 7.0), //(x,y)
              blurRadius: 10.0,
            ),
          ],
          color: Colors.amber[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(cardImageAssetString),
                radius: 55,
              ),
            ),
            Text(
              cardText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'SpecialElite',
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

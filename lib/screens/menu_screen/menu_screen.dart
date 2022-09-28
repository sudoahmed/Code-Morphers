import 'package:flutter/material.dart';
import 'package:sol_ventus/shared_components/custom_appbar.dart';

import '../../shared_components/type_writer_animated_title.dart';
import 'components/menu_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().buildCustomAppBar(context),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/info1');
        },
        child: const Icon(
          Icons.arrow_forward,
          size: 32,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: const TypeWriterAnimTitle(
                        animatedTitle: 'Please Select Your Experience',
                        alignment: Alignment.center),
                  ),
                  AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuCard(
                            cardText: 'Space Car',
                            cardImageAssetString:
                                'assets/images/launch_icon.png',
                            buttonCallBack: () {
                              print('1');
                            },
                          ),
                          MenuCard(
                            cardText: 'Space Music',
                            cardImageAssetString:
                                'assets/images/launch_icon.png',
                            buttonCallBack: () {
                              Navigator.pushNamed(context, '/musicScreen');
                            },
                          ),
                          // MenuCard(),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuCard(
                            cardText: 'Vibro Wind',
                            cardImageAssetString:
                                'assets/images/launch_icon.png',
                            buttonCallBack: () {
                              print('3');
                            },
                          ),
                          MenuCard(
                            cardText: 'Solar Data Charts',
                            cardImageAssetString:
                                'assets/images/launch_icon.png',
                            buttonCallBack: () {
                              print('4');
                            },
                          ),
                          // MenuCard(),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

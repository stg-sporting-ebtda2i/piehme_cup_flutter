import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/dialogs/loading_dialog.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String playerName = 'Patrick Remon';
  int coins = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateHeader();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateHeader();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateHeader() {
    setState(() {
      if(coins==80) {
        dismissLoadingDialog(context);
      }
      if(coins==62) {
        showLoadingDialog(context);
      }
      coins++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                playerName,
                style: const TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 140,
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(99999),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/coin.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      coins.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
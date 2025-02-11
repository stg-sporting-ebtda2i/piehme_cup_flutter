import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/routes/app_routes.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/widgets/widgets_button.dart';
import '../widgets/user_card.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updateCard();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _updateCard();
    }
  }

  void _updateCard() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            const Image(
              image: AssetImage('assets/other_background.png'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Column(
                children: [
                  SafeArea(child: Header()),
                  Expanded(child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 330,
                          height: 472,
                          child: PlayerCard(
                            width: 330,
                            name: 'Patrick Remon',
                            rating: 99,
                            iconURL: 'https://firebasestorage.googleapis.com/v0/b/quiz-fut-draft.appspot.com/o/CardIcons%2Ficon0.png?alt=media&token=926b31d4-7b75-4f57-ba28-28a78066628d',
                            image: null,
                            imageURL: 'https://firebasestorage.googleapis.com/v0/b/quiz-fut-draft.appspot.com/o/Users%2Fauto.png?alt=media&token=575a019d-e553-4be5-af05-8c50af82fdf4',
                            position: 'ST',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              width: 120,
                              height: 52,
                              text: 'Position',
                              isLoading: false,
                              fontSize: 18,
                              onClick: () {
                                Navigator.pushNamed(context, AppRoutes.positionsStore);
                              },
                            ),
                            Button(
                              width: 120,
                              height: 52,
                              text: 'Card',
                              isLoading: false,
                              fontSize: 18,
                              onClick: () {
                                Navigator.pushNamed(context, AppRoutes.cardsStore);
                              },
                            ),
                            Button(
                              width: 120,
                              height: 52,
                              text: 'Rating',
                              isLoading: false,
                              fontSize: 18,
                              onClick: () {
                                Navigator.pushNamed(context, AppRoutes.ratingStore);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),
                ],
              ),
            ),
          ],
        )
    );
  }
}

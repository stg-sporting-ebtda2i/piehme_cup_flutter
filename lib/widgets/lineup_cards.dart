import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/widgets/user_card.dart';
import 'package:piehme_cup_flutter/widgets/player_card.dart';

class Lineup extends StatefulWidget {
  final bool userLineup;
  const Lineup({super.key, required this.userLineup});

  @override
  State<Lineup> createState() => _LineupState();
}

class _LineupState extends State<Lineup> {
  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height/6.7;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Front Row (LW, ST, RW)
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayerCard(id: 'LW', userLineup: widget.userLineup, height: cardHeight,),
              Transform.translate(
                offset: Offset(0, -40),
                child: PlayerCard(id: 'ST', userLineup: widget.userLineup, height: cardHeight,),
              ),
              PlayerCard(id: 'RW', userLineup: widget.userLineup, height: cardHeight,),
            ],
          ),
        ),
        // Back Row (LCM, CAM, RCM)
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayerCard(id: 'LCM', userLineup: widget.userLineup, height: cardHeight,),
              Transform.translate(
                offset: Offset(0, -30),
                child: PlayerCard(id: 'CAM', userLineup: widget.userLineup, height: cardHeight,),
              ),
              PlayerCard(id: 'RCM', userLineup: widget.userLineup, height: cardHeight,),
            ],
          ),
        ),
        // Center Row (LB, LCB, RCB, RB)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlayerCard(id: 'LB', userLineup: widget.userLineup, height: cardHeight,),
            PlayerCard(id: 'LCB', userLineup: widget.userLineup, height: cardHeight,),
            PlayerCard(id: 'RCB', userLineup: widget.userLineup, height: cardHeight,),
            PlayerCard(id: 'RB', userLineup: widget.userLineup, height: cardHeight,),
          ],
        ),
        // Goalkeeper (GK)
        SizedBox(
          width: 559*cardHeight/800,
          height: cardHeight,
          child: UserCard(
            width: 559*cardHeight/800,
            name: 'Patrick Remon',
            rating: 99,
            iconURL: 'https://firebasestorage.googleapis.com/v0/b/quiz-fut-draft.appspot.com/o/CardIcons%2Ficon0.png?alt=media&token=926b31d4-7b75-4f57-ba28-28a78066628d',
            image: null,
            imageURL: 'https://firebasestorage.googleapis.com/v0/b/quiz-fut-draft.appspot.com/o/Users%2Fauto.png?alt=media&token=575a019d-e553-4be5-af05-8c50af82fdf4',
            position: 'ST',
          ),
        )
      ],
    );
  }
}
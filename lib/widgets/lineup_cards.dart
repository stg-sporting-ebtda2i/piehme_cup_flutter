import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/lineup_provider.dart';
import 'package:piehme_cup_flutter/utils/card_utils.dart';
import 'package:provider/provider.dart';

class Lineup extends StatefulWidget {

  final bool userLineup;

  const Lineup({super.key, required this.userLineup});

  @override
  State<Lineup> createState() => _LineupState();
}

class _LineupState extends State<Lineup> {

  late double _cardHeight;

  @override
  void initState() {
    super.initState();
    context.read<LineupProvider>().loadLineup();
  }

  @override
  Widget build(BuildContext context) {
    _cardHeight = MediaQuery.of(context).size.height/6.7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Front Row (LW, ST, RW)
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardsUtils.getCard(
                context: context,
                cardHeight: _cardHeight,
                clickable: widget.userLineup,
                position: 'LW'
              ),
              Transform.translate(
                offset: Offset(0, -40),
                child: CardsUtils.getCard(
                    context: context,
                    cardHeight: _cardHeight,
                    clickable: widget.userLineup,
                    position: 'ST'
                ),
              ),
              CardsUtils.getCard(
                  context: context,
                  cardHeight: _cardHeight,
                  clickable: widget.userLineup,
                  position: 'RW'
              ),
            ],
          ),
        ),
        // Back Row (LCM, CAM, RCM)
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardsUtils.getCard(
                  context: context,
                  cardHeight: _cardHeight,
                  clickable: widget.userLineup,
                  position: 'LCM'
              ),
              Transform.translate(
                offset: Offset(0, -30),
                child: CardsUtils.getCard(
                    context: context,
                    cardHeight: _cardHeight,
                    clickable: widget.userLineup,
                    position: 'CAM'
                ),
              ),
              CardsUtils.getCard(
                  context: context,
                  cardHeight: _cardHeight,
                  clickable: widget.userLineup,
                  position: 'RCM'
              ),
            ],
          ),
        ),
        // Center Row (LB, LCB, RCB, RB)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardsUtils.getCard(
                context: context,
                cardHeight: _cardHeight,
                clickable: widget.userLineup,
                position: 'LB'
            ),
            CardsUtils.getCard(
                context: context,
                cardHeight: _cardHeight,
                clickable: widget.userLineup,
                position: 'LCB'
            ),
            CardsUtils.getCard(
                context: context,
                cardHeight: _cardHeight,
                clickable: widget.userLineup,
                position: 'RCB'
                    ''),
            CardsUtils.getCard(
                context: context,
                cardHeight: _cardHeight,
                clickable: widget.userLineup,
                position: 'RB'
            ),
          ],
        ),
        // Goalkeeper (GK)
        CardsUtils.getCard(
            context: context,
            cardHeight: _cardHeight,
            clickable: widget.userLineup,
            position: 'GK'
        ),
      ],
    );
  }
}
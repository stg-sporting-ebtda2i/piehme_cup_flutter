import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/lineup_provider.dart';
import 'package:piehme_cup_flutter/widgets/lineup_scores_panel.dart';
import 'package:provider/provider.dart';
import '../widgets/lineup_cards.dart';

class LineupPage extends StatefulWidget {
  final bool userLineup;
  final int userId;
  const LineupPage({
    super.key,
    required this.userLineup,
    required this.userId,
  });

  @override
  State<LineupPage> createState() => _LineupPageState();
}

class _LineupPageState extends State<LineupPage> {

  @override
  void initState() {
    super.initState();
    LineupProvider provider = context.read<LineupProvider>();
    if (widget.userLineup) {
      provider.loadUserData();
    } else {
      provider.loadOtherUserData(widget.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lineup_background.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: const ScoresPanel(),
            ),
            Expanded(
              child: Center(
                child: Lineup(userLineup: widget.userLineup, userID: widget.userId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
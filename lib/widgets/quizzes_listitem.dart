import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/models/quiz.dart';
import 'package:piehme_cup_flutter/routes/app_routes.dart';

class QuizListItem extends StatelessWidget {
  final Quiz quiz;

  const QuizListItem({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !quiz.isSolved ? () => Navigator.pushNamed(context, AppRoutes.quiz, arguments: {'quizSlug': quiz.slug}) : null,
      child: Opacity(
        opacity: 0.75,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(42),
          ),
          child: Stack(
            children: [
            if (quiz.isSolved)
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/quiz.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      quiz.name,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '${quiz.coins} Coins',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
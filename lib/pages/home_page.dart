import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import '../components/choice_tile.dart';
import '../components/question_tile.dart';
import 'package:quran_demo_app/model/quran_question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool rightAnswer = false; // Flag to check if the selected answer is correct
  bool isAnswered = false; // Flag to check if an answer has been selected
  late QuranQuizQuestion quranQuizQuestion; // Instance of the quiz question
  late List<String> answerOptions; // List of answer options
  String? selectedAnswer; // The currently selected answer
  Map<String, String?> displayTexts =
      {}; // Map to hold display texts for options

  @override
  void initState() {
    super.initState();
    generateNewQuestion(); // Generate a new question on initialization
  }

  // Function to generate a new question and reset state
  void generateNewQuestion() {
    quranQuizQuestion = QuranQuizQuestion(); // Generate a question
    answerOptions = quranQuizQuestion.answerOptions; // Get answer options
    answerOptions
        .add(quranQuizQuestion.correctAnswer); // Add the correct answer
    answerOptions.shuffle(); // Shuffle the options
    setState(() {
      rightAnswer = false;
      isAnswered = false;
      selectedAnswer = null;
      displayTexts = {
        for (var option in answerOptions) option: null
      }; // Initialize display texts as null
    });
  }

  // Function to check if the selected answer is correct
  void _checkAnswer(String selectedAnswer) {
    setState(() {
      isAnswered = true;
      this.selectedAnswer = selectedAnswer;
      rightAnswer = selectedAnswer == quranQuizQuestion.correctAnswer;
      displayTexts[selectedAnswer] =
          rightAnswer ? 'الإجابة صحيحة' : 'خاطئة'; // Update display text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200, // Background color of the scaffold
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // The question text
                Text(
                  'ما الآية التي تلي هذه الآية',
                  style: GoogleFonts.ibmPlexSansArabic(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                  ),
                ),
                // GestureDetector to allow generating a new question on long press
                GestureDetector(
                    onLongPress: generateNewQuestion,
                    child: QuestionTile(verse: quranQuizQuestion.verse)),
                // Choose an answer text with Surah name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "سورة ${getSurahNameArabic(quranQuizQuestion.surahNumber)}",
                        style: GoogleFonts.ibmPlexSansArabic(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ),
                      Text(
                        'اختر آية',
                        style: GoogleFonts.ibmPlexSansArabic(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Choices with onTap callback
                for (var option in answerOptions)
                  ChoiceTile(
                    verse: option,
                    onTap: () => _checkAnswer(option),
                    borderColor: isAnswered
                        ? (quranQuizQuestion.correctAnswer == option
                            ? Colors.green
                            : (rightAnswer ? Colors.transparent : Colors.red))
                        : Colors.transparent,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

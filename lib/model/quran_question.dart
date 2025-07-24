import 'package:quran/quran.dart';

class QuranQuizQuestion {
  late String verse; // The verse of the question
  late List<String> answerOptions; // The list of answer options
  late String correctAnswer; // The correct answer to the question
  late int surahNumber; // The number of the surah that contains the verse
  late int verseNumber; // The number of the selected verse

  /// Generates a new Quran quiz question.
  ///
  /// This method creates a question by selecting a random verse and
  /// generating answer options based on it. It ensures that the selected
  /// verse has at least two subsequent verses in the same surah.
  QuranQuizQuestion() {
    bool isValidQuestion =
        false; // Flag to track if a valid question has been generated
    RandomVerse? selectedVerse; // The randomly selected verse

    // Loop until a valid question is generated
    while (!isValidQuestion) {
      selectedVerse = RandomVerse(); // Generate a random verse
      // Check if the verse has at least two subsequent verses in the same surah
      if (getVerseCount(selectedVerse.surahNumber) > 3 &&
          selectedVerse.verseNumber > 1 &&
          selectedVerse.verseNumber <
              getVerseCount(selectedVerse.surahNumber) - 1) {
        isValidQuestion = true; // Mark the question as valid
      }
    }

    // Set the question properties
    verse = selectedVerse!.verse +
        getVerseEndSymbol(
            selectedVerse.verseNumber); // Assign the verse with its end symbol
    answerOptions = [
      getVerse(selectedVerse.surahNumber, selectedVerse.verseNumber - 1),
      // Add the previous verse as an option
      getVerse(selectedVerse.surahNumber, selectedVerse.verseNumber + 2),
      // Add two verses ahead as an option
    ];
    correctAnswer = getVerse(selectedVerse.surahNumber,
        selectedVerse.verseNumber + 1); // The next verse is the correct answer
    surahNumber = selectedVerse.surahNumber;
    verseNumber = selectedVerse.verseNumber;
  }
}

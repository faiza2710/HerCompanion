import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fyp/education/modal/GeneralKModal.dart';
import 'package:fyp/education/modal/RandomModal.dart';
import 'package:fyp/education/modal/ScienceModal.dart';
import 'package:fyp/education/modal/HistoryModal.dart';
import 'package:fyp/education/modal/VideoGamesModal.dart';
import 'package:fyp/education/modal/GeographyModal.dart';
import 'package:fyp/education/modal/SportsModal.dart';
import 'package:html/parser.dart' as html_parser;

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<dynamic> _futureData;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;
  bool _isCorrect = false;

  final Map<String, Map<String, String>> _categoryInfo = {
    'General Knowledge': {
      'url': 'https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple',
      'modal': 'GeneralKModal',
    },
    'Science & Nature': {
      'url': 'https://opentdb.com/api.php?amount=10&category=17&difficulty=medium&type=multiple',
      'modal': 'ScienceModal',
    },
    'Sports': {
      'url': 'https://opentdb.com/api.php?amount=10&category=21&difficulty=medium&type=multiple',
      'modal': 'SportsModal',
    },
    'Geography': {
      'url': 'https://opentdb.com/api.php?amount=10&category=22&difficulty=medium&type=multiple',
      'modal': 'GeographyModal',
    },
    'History': {
      'url': 'https://opentdb.com/api.php?amount=10&category=23&difficulty=medium&type=multiple',
      'modal': 'HistoryModal',
    },
    'Video Games': {
      'url': 'https://opentdb.com/api.php?amount=10&category=15&difficulty=medium&type=multiple',
      'modal': 'VideoGamesModal',
    },
    'Random': {
      'url': 'https://opentdb.com/api.php?amount=10&difficulty=medium&type=multiple',
      'modal': 'RandomModal',
    },
  };

  @override
  void initState() {
    super.initState();
    _futureData = getUserData();
  }

  String decodeHtml(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body!.text;
  }

  Future<dynamic> getUserData() async {
    final categoryInfo = _categoryInfo[widget.category];
    if (categoryInfo == null) {
      throw Exception('Invalid category');
    }

    final apiUrl = categoryInfo['url'];
    final modalClass = categoryInfo['modal'];

    int retryCount = 0;
    const maxRetries = 3;
    const retryDelay = Duration(seconds: 2);

    while (retryCount < maxRetries) {
      try {
        final response = await http.get(Uri.parse(apiUrl!));
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          return _parseData(jsonData, modalClass!);
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        retryCount++;
        if (retryCount >= maxRetries) {
          throw Exception('Error fetching data after $maxRetries retries: $e');
        }
        await Future.delayed(retryDelay);
      }
    }
  }

  dynamic _parseData(Map<String, dynamic> jsonData, String modalClass) {
    switch (modalClass) {
      case 'GeneralKModal':
        return GeneralKModal.fromJson(jsonData);
      case 'ScienceModal':
        return ScienceModal.fromJson(jsonData);
      case 'SportsModal':
        return SportsModal.fromJson(jsonData);
      case 'GeographyModal':
        return GeographyModal.fromJson(jsonData);
      case 'HistoryModal':
        return HistoryModal.fromJson(jsonData);
      case 'VideoGamesModal':
        return VideoGamesModal.fromJson(jsonData);
      case 'RandomModal':
        return RandomModal.fromJson(jsonData);
      default:
        throw Exception('Unknown modal class');
    }
  }

  void _checkAnswer(String selectedAnswer, String correctAnswer) {
    setState(() {
      _isAnswered = true;
      _isCorrect = selectedAnswer == correctAnswer;
      if (_isCorrect) {
        _score++;
      }
    });
  }

  void _nextQuestion(int totalQuestions) {
    if (_currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        _currentQuestionIndex++;
        _isAnswered = false;
        _isCorrect = false;
      });
    } else {
      // If the current question is the last one, show the quiz results
      _showQuizResults();
    }
  }


  void _showQuizResults() {
    setState(() {
      _currentQuestionIndex = 0; // Reset the index for potential future quiz sessions
    });

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Quiz Completed!'),
        content: Text('You scored $_score out of 10.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            child: Text('OK', style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your color here
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.category, style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: FutureBuilder<dynamic>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.pink));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || (snapshot.data as dynamic).results == null) {
            return const Center(child: Text('No data available'));
          } else {
            final results = (snapshot.data as dynamic).results!;
            final currentQuestion = results[_currentQuestionIndex];
            final correctAnswer = currentQuestion.correctAnswer.toString();
            final incorrectAnswers = (currentQuestion.incorrectAnswers as List<dynamic>)
                .map((answer) => answer.toString())
                .toList();

            // Combine correct and incorrect answers and shuffle them
            final options = [...incorrectAnswers, correctAnswer]..shuffle();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}:',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    decodeHtml(currentQuestion.question.toString()),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ...options.map((option) {
                    return ListTile(
                      title: Text(decodeHtml(option)),
                      leading: Radio<String>(
                        value: option,
                        groupValue: _isAnswered ? correctAnswer : null,
                        onChanged: _isAnswered ? null : (value) {
                          _checkAnswer(value!, correctAnswer);
                        },
                      ),
                      tileColor: _isAnswered
                          ? option == correctAnswer
                          ? Colors.green.withOpacity(0.9)
                          : Colors.red.withOpacity(0.4)
                          : null,
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  if (_isAnswered)
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                      ),
                      onPressed: () => _nextQuestion(results.length),
                      child: const Text('Next Question', style: TextStyle(color: Colors.white)),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Flashcard class definition
class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});

  // Convert a Flashcard into a Map
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }

  // Convert a Map into a Flashcard
  factory Flashcard.fromMap(Map<String, dynamic> map) {
    return Flashcard(
      question: map['question'],
      answer: map['answer'],
    );
  }
}

// FlashcardScreen with embedded FlashcardInputForm
class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "What is the capital of France?", answer: "The capital of France is Paris."),
  ];

  @override
  void initState() {
    super.initState();
    _loadFlashcards();
  }

  Future<void> _loadFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsString = prefs.getString('flashcards');
    if (flashcardsString != null) {
      final List<dynamic> flashcardsList = jsonDecode(flashcardsString);
      setState(() {
        _flashcards = flashcardsList
            .map((item) => Flashcard.fromMap(item))
            .toList();
      });
    }
  }

  Future<void> _saveFlashcards() async {
    final prefs = await SharedPreferences.getInstance();
    final flashcardsList = _flashcards.map((flashcard) => flashcard.toMap()).toList();
    await prefs.setString('flashcards', jsonEncode(flashcardsList));
  }

  void _addFlashcard(String question, String answer) {
    if (question.isNotEmpty && answer.isNotEmpty) {
      setState(() {
        _flashcards.add(Flashcard(question: question, answer: answer));
      });
      _saveFlashcards();
    }
  }

  void _navigateToInputForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlashcardInputForm(),
      ),
    );

    if (result != null && result is Flashcard) {
      _addFlashcard(result.question, result.answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _flashcards.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue.shade100,
                    child: ListTile(
                      title: Text(
                        _flashcards[index].question,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(_flashcards[index].answer,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400)),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _flashcards.removeAt(index); // Remove specific flashcard
                          });
                          _saveFlashcards(); // Save flashcards after removing
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF142A70),
        onPressed: _navigateToInputForm,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FlashcardInputForm extends StatefulWidget {
  @override
  _FlashcardInputFormState createState() => _FlashcardInputFormState();
}

class _FlashcardInputFormState extends State<FlashcardInputForm> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  void _submitForm() {
    final question = _questionController.text;
    final answer = _answerController.text;

    if (question.isNotEmpty && answer.isNotEmpty) {
      final flashcard = Flashcard(question: question, answer: answer);
      Navigator.pop(context, flashcard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF142A70),
        leading: Image.asset('assets/images/appbar-icon.png'),
        title: Text('Add a Flashcard',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                hintText: 'Question',
                hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green.shade800, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
              cursorColor: Colors.green.shade800,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                hintText: 'Answer',
                hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green.shade800, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                labelStyle: TextStyle(color: Colors.black),
              ),
              cursorColor: Colors.green.shade800,
            ),
            SizedBox(height: 30.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green.shade800),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                ),
                onPressed: _submitForm,
                child: Text(
                  'Add Flashcard',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

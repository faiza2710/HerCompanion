import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"Geography","question":"The towns of Brugelette, Arlon and Ath are located in which country?","correct_answer":"Belgium","incorrect_answers":["Andorra","France","Luxembourg"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of the following is the longest river in Europe?","correct_answer":"Volga","incorrect_answers":["Danube","Ural","Dnieper"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Japanese Anime &amp; Manga","question":"The main antagonist of the second part of JoJo&#039;s Bizarre Adventure is which of the following?","correct_answer":"Kars","incorrect_answers":["Erina Joestar","Santana","Wired Beck"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"In Call of Duty: Modern Warfare 2, how many consecutive kills does it require to earn the &quot;Tactical Nuke&quot; killstreak?","correct_answer":"25","incorrect_answers":["20","30","35"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What is the mnemonic device for remembering the fates of the wives of Henry VIII?","correct_answer":"Divorced, Beheaded, Died, Divorced, Beheaded, Survived","incorrect_answers":["Beheaded, Died, Divorced, Divorced, Beheaded, Survived","Died, Beheaded, Divorced, Beheaded, Survived, Divorced","Survived, Beheaded, Died, Divorced, Divorced, Beheaded"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Television","question":"Which character does voice actress Tara Strong NOT voice?","correct_answer":"Bubbles (2016)","incorrect_answers":["Twilight Sparkle","Timmy Turner","Harley Quinn"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Film","question":"In the 1984 movie &quot;The Terminator&quot;, what model number is the Terminator portrayed by Arnold Schwarzenegger?","correct_answer":"T-800","incorrect_answers":["I-950","T-888","T-1000"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Musicals &amp; Theatres","question":"Which of the following is not a piece from the 1950&#039;s musical West Side Story?","correct_answer":"The Back Alley","incorrect_answers":["Maria","Tonight","Mambo"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Musicals &amp; Theatres","question":"The musical &quot;Dirty Rotten Scoundrels&quot; is set in what country?","correct_answer":"France","incorrect_answers":["USA","Germany","Sweden"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"In Overwatch, what is L&uacute;cio&#039;s full name?","correct_answer":"L&uacute;cio Correia Dos Santos","incorrect_answers":["L&uacute;cio Luiz L&oacute;s Guilherme","L&uacute;cio Jo&atilde;o Lucas","L&uacute;cio Chupar Prima"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Music","question":"What animal is featured on the cover of English electronic music group The Prodigy&#039;s album, &quot;The Fat of the Land&quot;?","correct_answer":"Crab","incorrect_answers":["Fox","Elephant","Tiger"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"The Pyrenees mountains are located on the border of which two countries?","correct_answer":"France and Spain","incorrect_answers":["Italy and Switzerland","Norway and Sweden","Russia and Ukraine"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Japanese Anime &amp; Manga","question":"In &quot;Highschool DxD&quot;, Koneko Toujou is from what race?","correct_answer":"Nekomata","incorrect_answers":["Kitsune","Human","Kappa"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"According to the United States&#039; CDC, one in how many Americans die annually due to smoking?","correct_answer":"Five","incorrect_answers":["Twenty","Ten","One hundred"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"The medial meniscus forms which part of what joint in the human body?","correct_answer":"Knee","incorrect_answers":["Elbow","Ankle","Shoulder"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"In &quot;Call Of Duty: Zombies&quot;, what is the name of Samantha Maxis&#039; dog?","correct_answer":"Fluffy","incorrect_answers":["Baxter","Fido","Henry"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"The default playermodel of Garry&#039;s Mod is this Half Life 2 character.","correct_answer":"Isaac Kleiner","incorrect_answers":["G-Man","Alyx Vance","Gordon Freeman"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Film","question":"What is the birth name of Michael Caine?","correct_answer":"Maurice Micklewhite","incorrect_answers":["Morris Coleman","Carl Myers","Martin Michaels"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What was the destination of the missing flight MH370?","correct_answer":"Beijing","incorrect_answers":["Kuala Lumpur","Singapore","Tokyo"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Television","question":"Which of the following was not an actor/actress on the American television show &quot;Saturday Night Live&quot; in Season 42?","correct_answer":"Tina Fey","incorrect_answers":["Mikey Day","Kate McKinnon","Sasheer Zamata"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Japanese Anime &amp; Manga","question":"Which studio made Cowboy Bebop?","correct_answer":"Sunrise","incorrect_answers":["Bones","Madhouse","Pierriot"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Television","question":"What is the title of The Allman Brothers Band instrumental used as the theme to the BBC motoring show, &#039;Top Gear&#039;?","correct_answer":"Jessica","incorrect_answers":["Angela","Erica","Sandra"]},{"type":"multiple","difficulty":"medium","category":"Politics","question":"What was the personal nickname of the 40th Governor of the US State Louisiana, Huey Long?","correct_answer":"The Kingfish","incorrect_answers":["The Champ","The Hoot Owl","The Oracle"]},{"type":"multiple","difficulty":"medium","category":"Science: Computers","question":"What is the correct term for the metal object in between the CPU and the CPU fan within a computer system?","correct_answer":"Heat Sink","incorrect_answers":["CPU Vent","Temperature Decipator","Heat Vent"]},{"type":"multiple","difficulty":"medium","category":"History","question":"How old was Lyndon B. Johnson when he assumed the role of President of the United States?","correct_answer":"55","incorrect_answers":["50","60","54"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Books","question":"Who wrote the children&#039;s story &quot;The Little Match Girl&quot;?","correct_answer":"Hans Christian Andersen","incorrect_answers":["Charles Dickens","Lewis Carroll","Oscar Wilde"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"What is not a playable race in &quot;Final Fantasy XIV: A Realm Reborn&quot;?","correct_answer":"Hume","incorrect_answers":["Miqo&#039;te","Lalafell","Roegadyn"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Japanese Anime &amp; Manga","question":"In &quot;Black Lagoon&quot;, what colour is Rock&#039;s tie?","correct_answer":"Teal","incorrect_answers":["Crimson","Dark Brown","Black"]},{"type":"multiple","difficulty":"medium","category":"Celebrities","question":"Which television show has Dan Gheesling been on?","correct_answer":"Big Brother","incorrect_answers":["Jeopardy","Survivor","The Bachelor"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Television","question":"Which British writer wrote for both Doctor Who and Sherlock?","correct_answer":"Steven Moffatt","incorrect_answers":["Phil Ford","Russell T Davies","Toby Whithouse"]}]

RandomModal quizModalFromJson(String str) => RandomModal.fromJson(json.decode(str));
String quizModalToJson(RandomModal data) => json.encode(data.toJson());
class RandomModal {
  RandomModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  RandomModal.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _responseCode;
  List<Results>? _results;
RandomModal copyWith({  num? responseCode,
  List<Results>? results,
}) => RandomModal(  responseCode: responseCode ?? _responseCode,
  results: results ?? _results,
);
  num? get responseCode => _responseCode;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "multiple"
/// difficulty : "medium"
/// category : "Geography"
/// question : "The towns of Brugelette, Arlon and Ath are located in which country?"
/// correct_answer : "Belgium"
/// incorrect_answers : ["Andorra","France","Luxembourg"]

Results resultsFromJson(String str) => Results.fromJson(json.decode(str));
String resultsToJson(Results data) => json.encode(data.toJson());
class Results {
  Results({
      String? type, 
      String? difficulty, 
      String? category, 
      String? question, 
      String? correctAnswer, 
      List<String>? incorrectAnswers,}){
    _type = type;
    _difficulty = difficulty;
    _category = category;
    _question = question;
    _correctAnswer = correctAnswer;
    _incorrectAnswers = incorrectAnswers;
}

  Results.fromJson(dynamic json) {
    _type = json['type'];
    _difficulty = json['difficulty'];
    _category = json['category'];
    _question = json['question'];
    _correctAnswer = json['correct_answer'];
    _incorrectAnswers = json['incorrect_answers'] != null ? json['incorrect_answers'].cast<String>() : [];
  }
  String? _type;
  String? _difficulty;
  String? _category;
  String? _question;
  String? _correctAnswer;
  List<String>? _incorrectAnswers;
Results copyWith({  String? type,
  String? difficulty,
  String? category,
  String? question,
  String? correctAnswer,
  List<String>? incorrectAnswers,
}) => Results(  type: type ?? _type,
  difficulty: difficulty ?? _difficulty,
  category: category ?? _category,
  question: question ?? _question,
  correctAnswer: correctAnswer ?? _correctAnswer,
  incorrectAnswers: incorrectAnswers ?? _incorrectAnswers,
);
  String? get type => _type;
  String? get difficulty => _difficulty;
  String? get category => _category;
  String? get question => _question;
  String? get correctAnswer => _correctAnswer;
  List<String>? get incorrectAnswers => _incorrectAnswers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['difficulty'] = _difficulty;
    map['category'] = _category;
    map['question'] = _question;
    map['correct_answer'] = _correctAnswer;
    map['incorrect_answers'] = _incorrectAnswers;
    return map;
  }

}
import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Which language is NOT Indo-European?","correct_answer":"Hungarian","incorrect_answers":["Russian","Greek","Latvian"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"When was Nintendo founded?","correct_answer":"September 23rd, 1889","incorrect_answers":["October 19th, 1891","March 4th, 1887","December 27th, 1894"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"According to the BBPA, what is the most common pub name in the UK?","correct_answer":"Red Lion","incorrect_answers":["Royal Oak","White Hart","King&#039;s Head"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Which iconic Disneyland attraction was closed in 2017 to be remodeled as a &quot;Guardians of the Galaxy&quot; themed ride?","correct_answer":"Twilight Zone Tower of Terror","incorrect_answers":["The Haunted Mansion","Pirates of the Caribbean","Peter Pan&#039;s Flight"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What character was once considered to be the 27th letter of the alphabet?","correct_answer":"Ampersand","incorrect_answers":["Interrobang","Tilde","Pilcrow"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"In the Morse code, which letter is indicated by 3 dots? ","correct_answer":"S","incorrect_answers":["O","A","C"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Which American manufactured submachine gun was informally known by the American soldiers that used it as &quot;Grease Gun&quot;?","correct_answer":"M3","incorrect_answers":["Colt 9mm","Thompson","MAC-10"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"In a standard set of playing cards, which is the only king without a moustache?","correct_answer":"Hearts","incorrect_answers":["Spades","Diamonds","Clubs"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"When was Hubba Bubba first introduced?","correct_answer":"1979","incorrect_answers":["1984","1972","1980"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Frank Lloyd Wright was the architect behind what famous building?","correct_answer":"The Guggenheim","incorrect_answers":["Villa Savoye","Sydney Opera House","The Space Needle"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What is the average life span of a garden ant?","correct_answer":"15 years","incorrect_answers":["24 hours","1 week","3 years"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Apple co-founder Steve Jobs died from complications of which form of cancer?","correct_answer":"Pancreatic","incorrect_answers":["Bone","Liver","Stomach"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"After how many years would you celebrate your crystal anniversary?","correct_answer":"15","incorrect_answers":["20","10","25"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What does a milliner make and sell?","correct_answer":"Hats","incorrect_answers":["Shoes","Belts","Shirts"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Which of the following buildings is example of a structure primarily built in the Art Deco architectural style?","correct_answer":"Niagara Mohawk Building","incorrect_answers":["Taipei 101","One Detroit Center","Westendstrasse 1"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What is the full title of the Prime Minister of the UK?","correct_answer":"First Lord of the Treasury","incorrect_answers":["Duke of Cambridge","Her Majesty&#039;s Loyal Opposition","Manager of the Crown Estate"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"When was the Declaration of Independence approved by the Second Continental Congress?","correct_answer":"July 4, 1776","incorrect_answers":["May 4, 1776","June 4, 1776","July 2, 1776"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"The website &quot;Shut Up &amp; Sit Down&quot; reviews which form of media?","correct_answer":"Board Games","incorrect_answers":["Television Shows","Video Games","Films"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What was the soft drink Pepsi originally introduced as?","correct_answer":"Brad&#039;s Drink","incorrect_answers":["Pepsin Pop","Carolina Cola","Pepsin Syrup"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What is the highest number of Michelin stars a restaurant can receive?","correct_answer":"Three","incorrect_answers":["Four","Five","Six"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Where did the pineapple plant originate?","correct_answer":"South America","incorrect_answers":["Hawaii","Europe","Asia"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Which logical fallacy means to attack the character of your opponent rather than their arguments?","correct_answer":"Ad hominem","incorrect_answers":["Post hoc ergo propter hoc","Tu quoque","Argumentum ad populum"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"In 2013 how much money was lost by Nigerian scams?","correct_answer":"$12.7 Billion","incorrect_answers":["$95 Million","$956 Million","$2.7 Billion"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"In ancient Greece, if your job were a &quot;hippeus&quot; which of these would you own?","correct_answer":"Horse","incorrect_answers":["Weave","Guitar","Boat"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"The Mexican Beer &quot;Corona&quot; is what type of beer?","correct_answer":"Pale Lager","incorrect_answers":["India Pale Ale","Pilfsner","Baltic Porter"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Directly between the Washington Monument and the Reflecting Pool is a memorial to which war?","correct_answer":"World War II","incorrect_answers":["Vietnam War","American Civil War","American Revolutionary War"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"Who is the founder of &quot;The Lego Group&quot;?","correct_answer":"Ole Kirk Christiansen","incorrect_answers":[" Jens Niels Christiansen","Kirstine Christiansen"," Gerhardt Kirk Christiansen"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What was the destination of the missing flight MH370?","correct_answer":"Beijing","incorrect_answers":["Kuala Lumpur","Singapore","Tokyo"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What is the star sign of someone born on Valentines day?","correct_answer":"Aquarius","incorrect_answers":["Pisces","Capricorn","Scorpio"]},{"type":"multiple","difficulty":"medium","category":"General Knowledge","question":"What name represents the letter &quot;M&quot; in the NATO phonetic alphabet?","correct_answer":"Mike","incorrect_answers":["Matthew","Mark","Max"]}]

GeneralKModal generalKModalFromJson(String str) => GeneralKModal.fromJson(json.decode(str));
String generalKModalToJson(GeneralKModal data) => json.encode(data.toJson());
class GeneralKModal {
  GeneralKModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  GeneralKModal.fromJson(dynamic json) {
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
GeneralKModal copyWith({  num? responseCode,
  List<Results>? results,
}) => GeneralKModal(  responseCode: responseCode ?? _responseCode,
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
/// category : "General Knowledge"
/// question : "Which language is NOT Indo-European?"
/// correct_answer : "Hungarian"
/// incorrect_answers : ["Russian","Greek","Latvian"]

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
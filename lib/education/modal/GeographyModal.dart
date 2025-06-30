import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"Geography","question":"On a London Underground map, what colour is the Circle Line?","correct_answer":"Yellow","incorrect_answers":["Red","Blue","Green"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What was the most populous city in the Americas in 2015?","correct_answer":"S&atilde;o Paulo","incorrect_answers":["New York","Mexico City","Los Angeles"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Where is the area commonly known as the Bermuda Triangle?","correct_answer":"North Atlantic Ocean, between Florida and Puerto Rico","incorrect_answers":["North Pacific Ocean, between Japan and the USA","In the Caribbean Sea","South Pacific Ocean, far off Chile"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Where is Hadrian&#039;s Wall located?","correct_answer":"Carlisle, England","incorrect_answers":["Rome, Italy","Alexandria, Egypt","Dublin, Ireland"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Kuala Lumpur is the capital of which country?","correct_answer":"Malaysia","incorrect_answers":["Indonesia","Singapore","Thailand"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What&#039;s the first National Park designated in the United States?","correct_answer":"Yellowstone","incorrect_answers":["Sequoia ","Yosemite","Rocky Mountain"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the right way to spell the capital of Hungary?","correct_answer":"Budapest","incorrect_answers":["Boodapest","Bhudapest","Budapast"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Where are the Nazca Lines located?","correct_answer":"Peru","incorrect_answers":["Brazil","Colombia","Ecuador"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of these country&#039;s capitals starts with the letter B?","correct_answer":"Lebanon","incorrect_answers":["Jordan","Kuwait","Qatar"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the largest non-continental island in the world?","correct_answer":"Greenland","incorrect_answers":["New Guinea","Borneo","Madagascar"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Frankenmuth, a US city nicknamed &quot;Little Bavaria&quot;, is located in what state?","correct_answer":"Michigan","incorrect_answers":["Pennsylvania","Kentucky","Virginia"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which Canadian province has Charlottetown as its capital?","correct_answer":"Prince Edward Island","incorrect_answers":["Saskachewan","Northwest Terrirories","Ontario"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of the following language families is the most controversial amongst modern linguists?","correct_answer":"Altaic","incorrect_answers":["Sino-Tibetan","Dravidian","Indo-European"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of these is NOT an island that is part of the Philippines?","correct_answer":"Java","incorrect_answers":["Luzon","Mindanao","Palawan"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the name of the former country that was succeeded by countries such as Serbia, Croatia and Slovenia?","correct_answer":"Yugoslavia","incorrect_answers":["Czechoslovakia","Abkhazia","South Ossetia"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of the following is NOT a capital city?","correct_answer":"Sydney","incorrect_answers":["Cairo","Moscow","Beijing"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the longest river in Europe?","correct_answer":"Volga","incorrect_answers":["Danube","Rhine","Thames"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the smallest country in South America by area?","correct_answer":"Suriname","incorrect_answers":["Brazil","Uruguay","Chile"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the capital of Peru?","correct_answer":"Lima","incorrect_answers":["Santiago","Montevideo","Buenos Aires"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"The formerly East-Prussian city of K&ouml;nigsberg is known as which Russian City today?","correct_answer":"Kaliningrad","incorrect_answers":["Kazan","Kursk","Krasnodar"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the capital city of New Zealand?","correct_answer":"Wellington","incorrect_answers":["Auckland","Christchurch","Melbourne"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What is the only country in the world with a flag that doesn&#039;t have four right angles?","correct_answer":"Nepal","incorrect_answers":["Panama","Angola","Egypt"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Where is the &quot;Sonoran Desert&quot; located?","correct_answer":"North America","incorrect_answers":["South America","Asia","Africa"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"All of the following are towns/villages in the Pacific Island nation of Kiribati EXCEPT:","correct_answer":"Urutora","incorrect_answers":["Rungata","London","Washington"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which country claims ownership of the disputed state Kosovo?","correct_answer":"Serbia","incorrect_answers":["Croatia","Albania","Macedonia"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"What European country is not a part of the EU?","correct_answer":"Norway","incorrect_answers":["Lithuania","Ireland","Czechia"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which European city has the highest mileage of canals in the world?","correct_answer":"Birmingham","incorrect_answers":["Venice","Amsterdam","Berlin"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which of the following is not a megadiverse country - one that harbors a high number of the earth&#039;s endemic species?","correct_answer":"Thailand","incorrect_answers":["Peru","Mexico","South Africa"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which is the largest city in Morocco?","correct_answer":"Casablanca","incorrect_answers":["Rabat","Fes","Sale"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"How many provinces are in the Netherlands?","correct_answer":"12","incorrect_answers":["14","10","13"]}]

GeographyModal geographyModalFromJson(String str) => GeographyModal.fromJson(json.decode(str));
String geographyModalToJson(GeographyModal data) => json.encode(data.toJson());
class GeographyModal {
  GeographyModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  GeographyModal.fromJson(dynamic json) {
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
GeographyModal copyWith({  num? responseCode,
  List<Results>? results,
}) => GeographyModal(  responseCode: responseCode ?? _responseCode,
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
/// question : "On a London Underground map, what colour is the Circle Line?"
/// correct_answer : "Yellow"
/// incorrect_answers : ["Red","Blue","Green"]

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
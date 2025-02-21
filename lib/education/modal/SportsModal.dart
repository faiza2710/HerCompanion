import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which country is hosting the 2022 FIFA World Cup?","correct_answer":"Qatar","incorrect_answers":["Uganda","Vietnam","Bolivia"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"What is the oldest team in the NFL?","correct_answer":"Arizona Cardinals","incorrect_answers":["Chicago Bears","Green Bay Packers","New York Giants"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"What is the nickname of Northampton town&#039;s rugby union club?","correct_answer":"Saints","incorrect_answers":["Harlequins","Saracens","Wasps"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"What is Tiger Woods&#039; all-time best career golf-score?","correct_answer":"61","incorrect_answers":["65","63","67"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who was the topscorer for England national football team?","correct_answer":"Wayne Rooney","incorrect_answers":["David Beckham","Steven Gerrard","Michael Owen"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"At which bridge does the annual Oxford and Cambridge boat race start?","correct_answer":"Putney","incorrect_answers":["Hammersmith","Vauxhall ","Battersea"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who won the 2015 College Football Playoff (CFP) National Championship? ","correct_answer":"Ohio State Buckeyes","incorrect_answers":["Alabama Crimson Tide","Clemson Tigers","Wisconsin Badgers"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which soccer team won the Copa Am&eacute;rica 2015 Championship ?","correct_answer":"Chile","incorrect_answers":["Argentina","Brazil","Paraguay"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"How many premier league trophies did Sir Alex Ferguson win during his time at Manchester United?","correct_answer":"13","incorrect_answers":["11","20","22"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which of these countries&#039; national teams qualified for the 2018 FIFA World Cup in Russia?","correct_answer":"Tunisia","incorrect_answers":["United States of America","Italy","Netherlands"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which German sportswear company&#039;s logo is the &#039;Formstripe&#039;?","correct_answer":"Puma","incorrect_answers":["Nike","Adidas","Reebok"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who won the 2018 Monaco Grand Prix?","correct_answer":"Daniel Ricciardo","incorrect_answers":["Sebastian Vettel","Kimi Raikkonen","Lewis Hamilton"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"How many games did Arsenal FC go unbeaten during the 2003-2004 season of the English Premier League","correct_answer":"38","incorrect_answers":["51","49","22"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which basketball team has attended the most NBA grand finals?","correct_answer":"Los Angeles Lakers","incorrect_answers":["Boston Celtics","Philadelphia 76ers","Golden State Warriors"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which sport is NOT traditionally played during the Mongolian Naadam festival?","correct_answer":"American Football","incorrect_answers":["Wrestling","Archery","Horse-Racing"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which Formula 1 driver switched teams in the middle of the 2017 season?","correct_answer":"Carlos Sainz Jr.","incorrect_answers":["Daniil Kvyat","Jolyon Palmer","Rio Haryanto"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who is Manchester United&#039;s top premier league goal scorer?","correct_answer":"Wayne Rooney","incorrect_answers":["Sir Bobby Charlton","Ryan Giggs","David Beckham"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"In Formula 1, the Virtual Safety Car was introduced following the fatal crash of which driver?","correct_answer":"Jules Bianchi","incorrect_answers":["Ayrton Senna","Ronald Ratzenberger","Gilles Villeneuve"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Josh Mansour is part of what NRL team?","correct_answer":"Penrith Panthers","incorrect_answers":["Melbourne Storm","Sydney Roosters","North Queensland Cowboys"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which nation hosted the FIFA World Cup in 2006?","correct_answer":"Germany","incorrect_answers":["United Kingdom","Brazil","South Africa"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who was the British professional wrestler Shirley Crabtree better known as?","correct_answer":"Big Daddy","incorrect_answers":["Giant Haystacks","Kendo Nagasaki","Masambula"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"The F1 season of 1994 is remembered for what tragic event?","correct_answer":"Death of Ayrton Senna (San Marino)","incorrect_answers":["The Showdown (Australia)","Verstappen on Fire (Germany)","Schumacher&#039;s Ban (Britain)"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"What year was hockey legend Wayne Gretzky born?","correct_answer":"1961","incorrect_answers":["1965","1959","1963"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"A stimpmeter measures the speed of a ball over what surface?","correct_answer":"Golf Putting Green","incorrect_answers":[" Football Pitch","Cricket Outfield","Pinball Table"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which car manufacturer won the 2016 24 Hours of Le Mans?","correct_answer":"Porsche","incorrect_answers":["Toyota","Audi","Ferrari"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"What is the exact length of one non-curved part in Lane 1 of an Olympic Track?","correct_answer":"84.39m","incorrect_answers":["100m","100yd","109.36yd"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which of the following Grand Slam tennis tournaments occurs LAST?","correct_answer":"US Open","incorrect_answers":["French Open","Wimbledon","Australian Open"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Who won the &quot;Champions League&quot; in 1999?","correct_answer":"Manchester United","incorrect_answers":["Barcelona","Bayern Munich","Liverpool"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"How many French Open&#039;s did Bj&ouml;rn Borg win?","correct_answer":"6","incorrect_answers":["4","9","2"]},{"type":"multiple","difficulty":"medium","category":"Sports","question":"Which of the following pitchers was named National League Rookie of the Year for the 2013 season?","correct_answer":"Jose Fernandez","incorrect_answers":["Jacob deGrom","Shelby Miller","Matt Harvey"]}]

SportsModal sportsModalFromJson(String str) => SportsModal.fromJson(json.decode(str));
String sportsModalToJson(SportsModal data) => json.encode(data.toJson());
class SportsModal {
  SportsModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  SportsModal.fromJson(dynamic json) {
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
SportsModal copyWith({  num? responseCode,
  List<Results>? results,
}) => SportsModal(  responseCode: responseCode ?? _responseCode,
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
/// category : "Sports"
/// question : "Which country is hosting the 2022 FIFA World Cup?"
/// correct_answer : "Qatar"
/// incorrect_answers : ["Uganda","Vietnam","Bolivia"]

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
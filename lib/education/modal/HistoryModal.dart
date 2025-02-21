import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"History","question":"What was the code name for the German invasion of the Soviet Union in WW2?","correct_answer":"Operation Barbarossa","incorrect_answers":["Operation Kaiserschlact","Operation Unthinkable","Operation Molotov"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What year did the Boxing Day earthquake &amp; tsunami occur in the Indian Ocean?","correct_answer":"2004","incorrect_answers":["2006","2008","2002"]},{"type":"multiple","difficulty":"medium","category":"History","question":" What Russian automatic gas-operated assault rifle was developed in the Soviet Union in 1947, and is still popularly used today?","correct_answer":"AK-47","incorrect_answers":["RPK","M16","MG 42"]},{"type":"multiple","difficulty":"medium","category":"History","question":"On what day did Germany invade Poland?","correct_answer":"September 1, 1939","incorrect_answers":["December 7, 1941","June 22, 1941","July 7, 1937"]},{"type":"multiple","difficulty":"medium","category":"History","question":"In relation to the British Occupation in Ireland, what does the IRA stand for.","correct_answer":"Irish Republican Army","incorrect_answers":["Irish Rebel Alliance","Irish Reformation Army","Irish-Royal Alliance"]},{"type":"multiple","difficulty":"medium","category":"History","question":"In what year did the First World War end?","correct_answer":"1918","incorrect_answers":["1914","1916","1912"]},{"type":"multiple","difficulty":"medium","category":"History","question":"During which American Civil War campaign did Union troops dig a tunnel beneath Confederate troops to detonate explosives underneath them?","correct_answer":"Siege of Petersburg","incorrect_answers":["Siege of Vicksburg","Antietam Campaign","Gettysburg Campagin"]},{"type":"multiple","difficulty":"medium","category":"History","question":"On which day did construction start on &quot;The Pentagon&quot;, the headquarters for the United States Department of Defense?","correct_answer":"September 11, 1941","incorrect_answers":["June 15, 1947","January 15, 1943","September 2, 1962"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Against which country did the Dutch Republic fight the Eighty Years&#039; War?","correct_answer":"Spain","incorrect_answers":["France","England","Portugal"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Which king was killed at the Battle of Bosworth Field in 1485? ","correct_answer":"Richard III","incorrect_answers":["Edward V","Henry VII","James I"]},{"type":"multiple","difficulty":"medium","category":"History","question":"When was the Grand Patriotic War in the USSR concluded?","correct_answer":"May 9th, 1945","incorrect_answers":["September 2nd, 1945","August 9th, 1945","December 11th, 1945"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What date was the first flight of the P-40 Warhawk?","correct_answer":"October 14 1938","incorrect_answers":["August 21 1939","January 12 1940","June 1 1939"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What year did Skoal, a smokeless Tobacco company, release their first line of Pouches, known as &quot;Skoal Bandits&quot;?","correct_answer":"1983","incorrect_answers":["1934","1984","1822"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Which American civilization is the source of the belief that the world would end or drastically change on December 21st, 2012?","correct_answer":"The Mayans","incorrect_answers":["The Incas","The Aztecs","The Navajos"]},{"type":"multiple","difficulty":"medium","category":"History","question":"In World War I, what was the name of the alliance of Germany, Austria-Hungary, the Ottoman Empire, and Bulgaria?","correct_answer":"The Central Powers","incorrect_answers":["The Axis Powers","The Federation of Empires","Authoritarian Alliance"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Which Nazi General was known as the &quot;Desert Fox&quot;?","correct_answer":"Erwin Rommel","incorrect_answers":["Gerd von Rundstadt","Wilhelm Keitel","Heinz Guderian "]},{"type":"multiple","difficulty":"medium","category":"History","question":"The Thirty Years War ended with which treaty?","correct_answer":"Peace of Westphalia","incorrect_answers":["Treaty of Versailles","Treaty of Paris","Peace of Prague"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Who tutored Alexander the Great?","correct_answer":"Aristotle","incorrect_answers":["Socrates","Plato","King Philip"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What is the name of the ship which was only a few miles away from the RMS Titanic when it struck an iceberg on April 14, 1912?","correct_answer":"Californian","incorrect_answers":["Carpathia","Cristol","Commerce"]},{"type":"multiple","difficulty":"medium","category":"History","question":"According to scholarly estimates, what percentage of the world population at the time died due to Tamerlane&#039;s conquests?","correct_answer":"5%","incorrect_answers":["1%","3%","&lt;1%"]},{"type":"multiple","difficulty":"medium","category":"History","question":"America&#039;s Strategic Defense System during the Cold War was nicknamed after this famous movie.","correct_answer":"Star Wars","incorrect_answers":["Jaws","Blade Runner","Alien"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Which of the following ancient Near Eastern peoples still exists as a modern ethnic group?","correct_answer":"Assyrians","incorrect_answers":["Babylonians","Hittites","Elamites"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What is the oldest US state?","correct_answer":"Delaware","incorrect_answers":["Rhode Island","Maine","Virginia"]},{"type":"multiple","difficulty":"medium","category":"History","question":"The Herero genocide was perpetrated in Africa by which of the following colonial nations?","correct_answer":"Germany","incorrect_answers":["Britain","Belgium","France"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What year is considered to be the year that the British Empire ended?","correct_answer":"1997","incorrect_answers":["1986","1981","1971"]},{"type":"multiple","difficulty":"medium","category":"History","question":"The creator of the Enigma Cypher and Machine was of what nationality?","correct_answer":"German","incorrect_answers":["American","British","Polish"]},{"type":"multiple","difficulty":"medium","category":"History","question":"On which aircraft carrier did the Doolitte Raid launch from on April 18, 1942 during World War II?","correct_answer":"USS Hornet","incorrect_answers":["USS Enterprise","USS Lexington","USS Saratoga"]},{"type":"multiple","difficulty":"medium","category":"History","question":"What nationality was sultan Saladin?","correct_answer":"Kurdish","incorrect_answers":["Arab","Egyptian","Syrian"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Which country had an &quot;Orange Revolution&quot; between 2004 and 2005?","correct_answer":"Ukraine","incorrect_answers":["Belarus","Latvia","Lithuania"]},{"type":"multiple","difficulty":"medium","category":"History","question":"Who is attributed credit for recording the epic poem The Odyssey?","correct_answer":"Homer","incorrect_answers":["Aristotle","Odysseus","Socrates"]}]

HistoryModal historyModalFromJson(String str) => HistoryModal.fromJson(json.decode(str));
String historyModalToJson(HistoryModal data) => json.encode(data.toJson());
class HistoryModal {
  HistoryModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  HistoryModal.fromJson(dynamic json) {
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
HistoryModal copyWith({  num? responseCode,
  List<Results>? results,
}) => HistoryModal(  responseCode: responseCode ?? _responseCode,
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
/// category : "History"
/// question : "What was the code name for the German invasion of the Soviet Union in WW2?"
/// correct_answer : "Operation Barbarossa"
/// incorrect_answers : ["Operation Kaiserschlact","Operation Unthinkable","Operation Molotov"]

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
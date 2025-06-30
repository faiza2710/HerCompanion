import 'dart:convert';
/// response_code : 0
/// results : [{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"The moons, Miranda, Ariel, Umbriel, Titania and Oberon orbit which planet?","correct_answer":"Uranus","incorrect_answers":["Jupiter","Venus","Neptune"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What mineral has the lowest number on the Mohs scale?","correct_answer":"Talc","incorrect_answers":["Quartz","Diamond","Gypsum"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which element has the atomic number of 7?","correct_answer":"Nitrogen","incorrect_answers":["Oxygen","Hydrogen","Neon"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"To the nearest minute, how long does it take for light to travel from the Sun to the Earth?","correct_answer":"8 Minutes","incorrect_answers":["6 Minutes","2 Minutes","12 Minutes"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Where did the Great Storm of 1987 make landfall at, first?","correct_answer":"Cornwall","incorrect_answers":["Surrey","Wales","The Midlands"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is the colour of unoxidized blood?","correct_answer":"Red","incorrect_answers":["Blue","Purple","Green"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Who made the discovery of X-rays?","correct_answer":"Wilhelm Conrad R&ouml;ntgen","incorrect_answers":["Thomas Alva Edison","James Watt","Albert Einstein"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is the half-life of Uranium-235?","correct_answer":"703,800,000 years","incorrect_answers":["4,300,400,000 years","1,260,900,000 years","Uranium-235 is a stable isotope"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is the scientific term for &#039;taste&#039;?","correct_answer":"Gustatory Perception","incorrect_answers":["Olfaction","Somatosensation","Auditory Perception"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Myopia is the scientific term for which condition?","correct_answer":"Shortsightedness","incorrect_answers":["Farsightedness","Double Vision","Clouded Vision"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Down Syndrome is usually caused by an extra copy of which chromosome?","correct_answer":"21","incorrect_answers":["23","15","24"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Along with Oxygen, which element is primarily responsible for the sky appearing blue?","correct_answer":"Nitrogen","incorrect_answers":["Helium","Carbon","Hydrogen"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which planet did the &quot;Viking 1&quot; spacecraft send surface images of, starting in 1976?","correct_answer":"Mars","incorrect_answers":["Saturn","Jupiter","Venus"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"In Psychology, which need appears highest in the &quot;Maslow&#039;s hierarchy of needs&quot; pyramid?","correct_answer":"Esteem","incorrect_answers":["Love","Safety","Physiological"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is the name of the cognitive bias wherein a person with low ability in a particular skill mistake themselves as being superior?","correct_answer":"Dunning-Kruger effect","incorrect_answers":["Meyers-Briggs effect","M&uuml;ller-Lyer effect","Freud-Hall effect"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which of the following is NOT a passive electrical component?","correct_answer":"Transistor","incorrect_answers":["Resistor","Capacitor","Inductor"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"How many officially recognized dwarf planets in the solar system are named after Polynesian deities?","correct_answer":"2","incorrect_answers":["0","1","5"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which psychological term refers to the stress of holding contrasting beliefs?","correct_answer":"Cognitive Dissonance","incorrect_answers":["Flip-Flop Syndrome","Split-Brain","Blind Sight"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which portion of the Marijuana plant produces the psychoactive substance known as THC?","correct_answer":"Female Flower","incorrect_answers":["Leaves","Male Flower","Root Ball"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What stage of development do the majority of eukaryotic cells remain in for most of their life?","correct_answer":"Interphase","incorrect_answers":["Prophase","Stasis","Telophase"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Which of these is NOT a part of the structure of a typical neuron?","correct_answer":"Islets of Langerhans","incorrect_answers":["Node of Ranvier","Schwann cell","Myelin sheath"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is the chemical formula for ammonia?","correct_answer":"NH3","incorrect_answers":["CO2","NO3","CH4"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"On the periodic table of elements, what is the symbol for Tin?","correct_answer":"Sn","incorrect_answers":["Ti","Ni","Na"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"The Axiom of Preventive Medicine states that people with ___ risk for a disease should be screened and we should treat ___ of those people.","correct_answer":"low, all","incorrect_answers":["low, some","high, all","high, some"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"What is radiation measured in?","correct_answer":"Gray ","incorrect_answers":["Watt","Decibel","Kelvin"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"The Sun consists of mostly which two elements?","correct_answer":"Hydrogen &amp; Helium","incorrect_answers":["Hydrogen &amp; Nitrogen","Carbon &amp; Nitrogen","Carbon &amp; Helium"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"An organism described as &quot;heliotropic&quot; has a tendancy to move towards which of these things?","correct_answer":"Light","incorrect_answers":["Water","Trees","Pollen"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"At what temperature does water boil?","correct_answer":"212&deg;F","incorrect_answers":["200&deg;F","181&deg;F","178&deg;F"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"About how old is Earth?","correct_answer":"4.5 Billion Years","incorrect_answers":["3.5 Billion Years","2.5 Billion Years","5.5 Billion Years"]},{"type":"multiple","difficulty":"medium","category":"Science &amp; Nature","question":"Gannymede is the largest moon of which planet?","correct_answer":"Jupiter","incorrect_answers":["Uranus","Neptune","Mars"]}]

ScienceModal scienceModalFromJson(String str) => ScienceModal.fromJson(json.decode(str));
String scienceModalToJson(ScienceModal data) => json.encode(data.toJson());
class ScienceModal {
  ScienceModal({
      num? responseCode, 
      List<Results>? results,}){
    _responseCode = responseCode;
    _results = results;
}

  ScienceModal.fromJson(dynamic json) {
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
ScienceModal copyWith({  num? responseCode,
  List<Results>? results,
}) => ScienceModal(  responseCode: responseCode ?? _responseCode,
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
/// category : "Science &amp; Nature"
/// question : "The moons, Miranda, Ariel, Umbriel, Titania and Oberon orbit which planet?"
/// correct_answer : "Uranus"
/// incorrect_answers : ["Jupiter","Venus","Neptune"]

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
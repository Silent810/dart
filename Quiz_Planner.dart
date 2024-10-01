import 'dart:io';
import 'dart:math';

// Class Question with its parameters
class Question {
  final String question;
  final List<String> options;
  final String answer;

  // Parameters are required in this way 
  Question(this.question, this.options, this.answer);
}

void main() {
  final questions = [
    // Method applied learned in the last topic from sir to decrease the lines 
    Question('Which city was first capital of Pakistan?', ['Islamabad', 'Lahore', 'Karachi', 'Peshawar'], 'Karachi'),
    Question('What is 2 + 2?', ['3', '4', '5', '6'], '4'),
    Question('Largest planet in Solar System?', ['Earth', 'Mars', 'Jupiter', 'Sun'], 'Jupiter'),
    Question('Year of Pakistan\'s Independence?', ['1938', '1947', '1965', '1977'], '1947'),
    Question('Who is famous baller "In Pakistan"?', ['Shoaib Akhtar', 'Babar Azam', 'Bohemia', 'Nawaz'], 'Shoaib Akhtar'),
    Question('Famous university of Bahawalpur', ['Islamia University', 'Allama Iqbal University', 'Sindh University', 'LUMS University'], 'Islamia University'),
  ];

  // Shuffling questions randomly so no cheating will happen
  questions.shuffle(Random());
  int score = 0;
  
  // Starting the program
  print('Welcome to the Quiz!\n');
  
  for (var q in questions) {
    print('${q.question}\n');
    
    for (var i = 0; i < q.options.length; i++) {
      print('${i + 1}: ${q.options[i]}');
    }
    
    // Getting input of answer from the user
    stdout.write('Your answer (1-${q.options.length}): ');
    var answer = int.tryParse(stdin.readLineSync()!) ?? 0;
    
    if (q.options[answer - 1] == q.answer) {
      print('Correct!\n');
      score++;
    } else {
      print('Wrong! The correct answer is: ${q.answer}\n');
    }
  }
  
  // Appreciating user if he got the full numbers in test
  print('Your score: $score/${questions.length}\n');
  
  int a = questions.length;
  if (score == a) {
    print('You are a good learner, we appreciate your intelligence!\n');
  }
  
  print('Thanks for playing!');
}

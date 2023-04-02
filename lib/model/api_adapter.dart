import 'dart:convert';
import 'model_quiz.dart';

// api 어댑터. HomeScreen에서 api 데이터를 가져오자
List<Quiz> parseQuizs(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
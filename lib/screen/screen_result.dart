import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_home.dart';

class ResultScreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;

  ResultScreen({required this.answers, required this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        score += 1;
      }
    }

    return WillPopScope(
      onWillPop: () async => false, // 안드로이드 뒤로가기 방지
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz APP'),
          backgroundColor: Colors.deepOrangeAccent,
          leading: Container(),
        ),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepOrangeAccent),
                color: Colors.deepOrangeAccent,
              ),
              width: width * 0.85,
              height: height * 0.5,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                    ),
                    width: width * 0.73,
                    height: height * 0.25,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              0, width * 0.048, 0, width * 0.012),
                          child: Text(
                            '수고하셨습니다!',
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '당신의 점수는',
                          style: TextStyle(
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // 아래쪽으로 나머지 위젯 배치되도록
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          score.toString() + '/' + quizs.length.toString(),
                          style: TextStyle(
                              fontSize: width * 0.21,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: width * 0.012),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: width * 0.048),
                    child: ButtonTheme(
                      minWidth: width * 0.073,
                      height: height * 0.05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        child: Text('홈으로 돌아가기', style: TextStyle(
                              color: Colors.black),),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

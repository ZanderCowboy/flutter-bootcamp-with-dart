import 'package:flutter/material.dart';
import 'package:quizzler/repository/brains.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final brains = Brains();

  @override
  Widget build(BuildContext context) {
    void onPressed(bool answer) {
      setState(() {
        brains.updateAnswers(answer);
      });

      if (brains.isFinished) {
        Alert(
          context: context,
          type: AlertType.success,
          content: Column(
            children: [
              Text('Finished! These were your answers:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...brains.answers,
                ],
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  brains.reset();
                });
                Navigator.pop(context);
              },
              child: Text('Restart'),
            ),
            DialogButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ).show();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brains.question.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => onPressed(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => onPressed(false),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...brains.answers,
          ],
        )
      ],
    );
  }
}

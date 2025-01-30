import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: IAmPoor(),
    ),
  );
}

class IAmPoor extends StatelessWidget {
  const IAmPoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('I am Poor'),
      ),
      body: Center(
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/mooi_coal.jpeg'),
        ),
      ),
    );
  }
}

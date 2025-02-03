import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:mi_card/challenge.dart';

void main(List<String> args) {
  // Layout Challange
  // runApp(Challenge());

  runApp(MiCard());
}

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  'assets/images/profile.jpeg',
                ),
              ),
              Text(
                'Zander Kotze',
                style: TextStyle(
                  fontFamily: 'Rouge_Script',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Tinos',
                  letterSpacing: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  child: Divider(
                    height: 1,
                  ),
                ),
              ),
              _ReusableTile(
                icon: Icons.phone,
                text: '+27 79 747 4086',
              ),
              SizedBox(height: 10),
              _ReusableTile(
                icon: Icons.email,
                text: 'zanderkotze99@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReusableTile extends StatelessWidget {
  const _ReusableTile({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.teal.shade900,
          ),
        ),
        tileColor: Colors.white,
        minLeadingWidth: 36,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

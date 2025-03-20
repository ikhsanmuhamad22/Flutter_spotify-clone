import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/pages/choose_mode.dart';
import 'package:spotify_clone/presentation/widget/big_button.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BigButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseModePage()),
                      );
                    },
                    text: 'Get Started',
                    height: 70,
                  ),
      ),
    );
  }
}
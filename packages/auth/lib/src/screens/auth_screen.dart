import 'package:flutter/material.dart';

import 'auth_card.dart';

class AuthScreen extends StatelessWidget {

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF002026).withOpacity(0.4),
                  const Color.fromRGBO(0, 0, 0, 1.0).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: const Center(
                  child: AuthCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

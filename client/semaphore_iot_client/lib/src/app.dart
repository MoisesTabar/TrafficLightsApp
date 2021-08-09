import 'package:flutter/material.dart';
import 'package:semaphore_iot_client/src/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semáforo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Semáforo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[850],
          ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
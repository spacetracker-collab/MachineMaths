import 'package:flutter/material.dart';

import 'LoadImagePage.dart';
import 'SolverPage.dart';
import 'Scorecard.dart';

class EquationPage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Real Alphanumeric'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Good going.\n The numbers are\n 039993',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(  color: Colors.black,
                  fontSize: 40,
                  fontStyle: FontStyle.italic),
            ),

            TextButton(

              child: Text('Go to Next Stage'),
              style: TextButton.styleFrom(

                primary: Colors.white,

                backgroundColor: Colors.teal,

                onSurface: Colors.grey,
                textStyle: TextStyle(

                    color: Colors.black,

                    fontSize: 40,

                    fontStyle: FontStyle.italic

                ),

              ),


              onPressed: () {

                print('Pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SolverPage()),
                );

              },



            ),
          ],
        ),
      ),

    );
  }
}


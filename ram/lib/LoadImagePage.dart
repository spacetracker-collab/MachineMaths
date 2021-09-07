import 'package:flutter/material.dart';
import 'EquationPage.dart';
import 'dart:math';

class LoadImagePage extends StatelessWidget {
  final _controller = TextEditingController();
  String val = "";
  // user defined function

  String _getRandomPath()
  {
    Random random = new Random();
    int randomNumber = random.nextInt(20);
    String randomNumString = randomNumber.toString();
    String result = "assets/"+randomNumString+".png";
    return result;
  }
  void _showDialog(BuildContext context) {
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Name cannot be empty"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    ;
  }
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


            Image.asset(this._getRandomPath()),
            SizedBox(height: 10),
            Text(
              'Enter the numbers from image',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              cursorColor: Colors.greenAccent,
              decoration: InputDecoration(
                  hintText: "Enter numbers here",
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10.0)
                  )),
              onChanged: (val) {
                this.val = _controller.text.toString();
              },
            ),
            SizedBox(height: 10),

            TextButton(

              child: Text('Submit'),
              style: TextButton.styleFrom(

                primary: Colors.white,

                backgroundColor: Colors.teal,

                onSurface: Colors.grey,
                textStyle: TextStyle(

                    color: Colors.black,

                    fontSize: 12,

                    fontStyle: FontStyle.italic

                ),

              ),


              onPressed: () {
                print(_controller.text);
                if (this.val.isEmpty) {
                  print("Empty");
                  this._showDialog(context);
                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EquationPage()),
                  );
                };
              }



            ),
            SizedBox(height: 10),
            TextButton(

                child: Text('Reveal Answer'),
                style: TextButton.styleFrom(

                  primary: Colors.white,

                  backgroundColor: Colors.teal,

                  onSurface: Colors.grey,
                  textStyle: TextStyle(

                      color: Colors.black,

                      fontSize: 12,

                      fontStyle: FontStyle.italic

                  ),

                ),


                onPressed: () {

                  _controller.text = "039993";
                }



            ),


          ],
        ),
            )

    );
  }
}
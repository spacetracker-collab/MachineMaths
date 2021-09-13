import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:ram/main.dart';
import 'dart:math';
import 'Scorecard.dart';
import 'globals.dart' as globals;
import  'SolverPage.dart';




class LoadImagePage extends StatelessWidget {
  var _controller = TextEditingController();
  String val = "";


  // user defined function

  String _getRandomPath()
  {
    Random random = new Random();

    print(globals.maxPlate);
    if(globals.maxPlate > 0) {
      globals.thisPlate = random.nextInt(globals.maxPlate);
    }
    else
      {
        globals.thisPlate = 1;
      }
      globals.numberPlate.forEach((NumberPlate) {
      globals.maxPlate=0;
      if (NumberPlate.assetId == globals.thisPlate)
      {
        globals.thisPlateNum =  NumberPlate.imageDigits;
      }

    });
    //print("Globals " + globals.thisPlate.toString());
    //print("Globals " + globals.thisPlateNum.toString());

    String thisPlateString = globals.thisPlate.toString();
    String result = "assets/"+thisPlateString+".png";

    return result;
  }

  showAlertDialog(BuildContext context) {

    Widget continueButton = TextButton(
      child: Text("Ok"),
      onPressed:  () {

        Navigator.of(context,rootNavigator: true).pop();
        print('onEnd');

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("The Digits detected were wrong"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
    void onEnd() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Scorecard()),
      );
      print('onEnd');

    }
    var countDownController = CountdownTimerController(endTime: endTime, onEnd: onEnd);

    var buttonPanel = new Row(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextButton(

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

              }



          ),
          ),
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(

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
                  if ((this.val.isEmpty) ||
                    (globals.thisPlateNum != _controller.text))
                  {
                    print("Empty");
                    this.showAlertDialog(context);
                    //this._showDialog(context);
                  }
                  else {


                    globals.equation = globals.thisPlateNum;
                    //globals.equation = _controller.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          SolverPage()),
                    );
                  };
                }



            ),
          ),


      ],
    );


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Real Alphanumeric'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
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

            CountdownTimer(
              controller: countDownController,
              onEnd: onEnd,
              endTime: endTime,
            ),
            Image.asset(this._getRandomPath(), height: 75,
                fit:BoxFit.fill),
            SizedBox(height: 10),
            Text(
              'Enter the numbers from image in same order. No retries.',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(  color: Colors.black,
                  fontSize: 12,
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
            buttonPanel,





          ],
        ),
            ),



    );
  }
}
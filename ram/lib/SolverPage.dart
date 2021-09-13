import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:ram/main.dart';
import 'Scorecard.dart';
import 'globals.dart' as globals;
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';


class SolverPage extends StatelessWidget {

  final _controller = TextEditingController();

  /// Hide the soft keyboard.
  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _showDialogSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("You solved it!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scorecard()));

              },
            ),
          ],
        );
      },
    );
  }


  void _showDialogFailure(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Failure"),
          content: new Text("You did not solve it!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );

              },
            ),
          ],
        );
      },
    );
  }

  bool isDigit(String s, int idx) {
    return s[idx] == "0"
        || s[idx] == "1"
        || s[idx] == "2"
        || s[idx] == "3"
        || s[idx] == "4"
        || s[idx] == "5"
        || s[idx] == "6"
        || s[idx] == "7"
        || s[idx] == "8"
        || s[idx] == "9";
  }
  bool _verifySolution (String equation)
  {


    try {
      String digitEquation = "";
      for (int i = 0; i < equation.length; i++) {
        if (isDigit(equation, i)) {
          digitEquation = digitEquation + equation[i];
        }
      }
      //print("Digit Equation is " + digitEquation);
      List <String> digitEquationList = digitEquation.split("");
      digitEquationList.sort();
      String digitEquationFinal = "";
      for (int i = 0; i < digitEquationList.length; i ++) {
        digitEquationFinal = digitEquationFinal +
            digitEquationList[i].toString();
      }
      print("Digit Equation Input Sorted is " + digitEquationFinal);

      List <String> databaseEquationList = globals.thisPlateNum.split("");
      databaseEquationList.sort();
      String databaseEquationFinal = "";
      for (int i = 0; i < databaseEquationList.length; i ++) {
        databaseEquationFinal = databaseEquationFinal +
            databaseEquationList[i].toString();
      }
      print("Database Equation Input Sorted is " + databaseEquationFinal);

      //check if the db has the same numbers as the sorted input from user
      if (digitEquationFinal != databaseEquationFinal) return false;


      //Now we process the input equation
      //equation = "((2*4)-1)=((2*4)-1)";
      final equationList = equation.split("=");
      var expressionLHS = equationList[0];
      var expressionRHS = equationList[1];

      Parser p = Parser();
      Expression expLHS = p.parse(expressionLHS.toString());
      ContextModel cm = ContextModel();
      double evalLHS = expLHS.evaluate(EvaluationType.REAL, cm);
      Expression expRHS = p.parse(expressionRHS.toString());
      double evalRHS = expRHS.evaluate(EvaluationType.REAL, cm);

      print("LHS:" + evalLHS.toString());
      print("RHS:" + evalRHS.toString());


      if (evalLHS == evalRHS) {
        return true;
      }
      else {
        return false;
      }
    }
    catch(e)
    {
      print('Message $e');
      return false;
    }




  }
  @override
  Widget build(BuildContext context) {
    this.hideKeyboard(context);
    const title = 'Create Equation';
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;
    void onEnd() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
      print('onEnd');

    }
    var countDownController = CountdownTimerController(endTime: endTime, onEnd: onEnd);



    String equationString = "Solve for " + globals.equation;

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body:
        new GestureDetector(
        onTap: () {
          this.hideKeyboard(context);
          // call this method hflutter build apk --releaseere to hide soft keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },



        child: ButtonBar(
            children: [

              CountdownTimer(
                controller: countDownController,
                onEnd: onEnd,
                endTime: endTime,
              ),
              Text(
                equationString,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(  color: Colors.black,
                    fontSize: 40,
                    fontStyle: FontStyle.italic),
              ),

          SizedBox(
            width: 400,
            height: 60,
            child:

          TextField(
                readOnly: true,
                controller: _controller,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    hintText: "Enter text here",
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.0)
                    )),
                  onTap: (){
                        this.hideKeyboard(context);
                     },

                onChanged: (val) {

                  val = _controller.text.toString();
                },
              ),),

            ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("1"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "1";
                    },
                  ),
                  RaisedButton(
                    child: Text("2"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "2";
                    },
                  ),
                  RaisedButton(
                    child: Text("3"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){ _controller.text =  _controller.text + "3";},
                  ),
                  RaisedButton(
                    child: Text("4"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "4";
                    },
                  ),
                ],
              ),

        ButtonBar(
          children: [
            RaisedButton(
              child: Text("5"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                _controller.text =  _controller.text + "5";
              },
            ),
            RaisedButton(
              child: Text("6"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                _controller.text =  _controller.text + "6";
              },
            ),
            RaisedButton(
              child: Text("7"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                _controller.text =  _controller.text + "7";
              },
            ),
            RaisedButton(
              child: Text("8"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){
                _controller.text =  _controller.text + "8";
              },
            ),
          ],
        ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("9"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "9";
                    },
                  ),

                  RaisedButton(
                    child: Text("0"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "0";
                    },
                  ),
                  RaisedButton(
                    child: Text("*"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "*";
                    },
                  ),
                  RaisedButton(
                    child: Text("^"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "^";
                    },
                  ),

                ],
              ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("/"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "/";
                    },
                  ),
                  RaisedButton(
                    child: Text("%"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "%";
                    },
                  ),
                  RaisedButton(
                    child: Text("+"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){ _controller.text =  _controller.text + "+";},
                  ),
                  RaisedButton(
                    child: Text("-"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "-";
                    },
                  ),

                ],
              ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("="),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + "=";
                    },
                  ),
                  RaisedButton(
                    child: Text("("),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){ _controller.text =  _controller.text + "(";},
                  ),
                  RaisedButton(
                    child: Text(")"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text =  _controller.text + ")";
                    },
                  ),
                  RaisedButton(
                    child: Text("Del"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      if (_controller.text.isEmpty) return;
                      if(_controller.text.length == 1)
                      {
                          _controller.text="";
                          return;
                      }
                      var substring_text = _controller.text.substring(0, _controller.text.length-1);
                      _controller.text = substring_text;
                      return;


                    },
                  ),
                ],
              ),

              ButtonBar(
                children: [

                  RaisedButton(
                    child: Text("Cls"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){
                      _controller.text = "";
                    },
                  ),

                ],
              ),

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

              bool value = this._verifySolution(_controller.text);
              if(value == true)
              {
                this._showDialogSuccess(context);
                    //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => Scorecard()),


            }
            else
              {
              this._showDialogFailure(context);

              //Navigator.push(
                  //  context,
                   // MaterialPageRoute(builder: (context) => Scorecard()));
              }
            }


          ),




             ],
    ),
    )));
  }
}
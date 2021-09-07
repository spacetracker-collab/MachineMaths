import 'package:flutter/material.dart';
import 'package:ram/EquationPage.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'LoadImagePage.dart';
import 'EquationPage.dart';
import 'Scorecard.dart';

class SolverPage extends StatelessWidget {

  final _controller = TextEditingController();

  bool _verifySolution (String equation)
  {



    equation = "((2^4)-1)=((2^4)-1)";
    final equationList = equation.split("=");
    var expressionLHS = equationList[0];
    var expressionRHS = equationList[1];

   Parser p = Parser();
   Expression expLHS = p.parse(expressionLHS.toString());
   ContextModel cm = ContextModel();
   double evalLHS = expLHS.evaluate(EvaluationType.REAL, cm);
   Expression expRHS = p.parse(expressionLHS.toString());
   double evalRHS = expRHS.evaluate(EvaluationType.REAL, cm);

   print("LHS:"+evalLHS.toString());
   print("RHS:"+evalRHS.toString());







    return true;
  }
  @override
  Widget build(BuildContext context) {
    const title = 'Create Equation';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(


        child: ButtonBar(
            children: [

              Text(
                'Good going.\n Fit an equation to \n 0-3-9-9-9-3',
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
                controller: _controller,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    hintText: "Enter text here",
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.0)
                    )),
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
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("2"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("3"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("4"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                ],
              ),

        ButtonBar(
          children: [
            RaisedButton(
              child: Text("5"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("6"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("7"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("8"),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: (){},
            ),
          ],
        ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("0"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("*"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("^"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("/"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                ],
              ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("%"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("+"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("-"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("="),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                ],
              ),

              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("("),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text(")"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("1/x"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("AC"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
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

                  fontSize: 40,

                  fontStyle: FontStyle.italic

              ),

            ),


            onPressed: () {

              this._verifySolution(_controller.text);
              print('Pressed');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scorecard()),
              );

            },


          ),
                ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("Clear Current"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("Clear All"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("->"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                  RaisedButton(
                    child: Text("<-"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: (){},
                  ),
                ],
              ),




             ],
    ),
    ),));
  }
}
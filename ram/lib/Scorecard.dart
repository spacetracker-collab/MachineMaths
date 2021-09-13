import 'package:flutter/material.dart';
import 'main.dart';

class Scorecard extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = 'Scores';

    return new WillPopScope(
        onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
          title: Text("Scores"),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children:[
            Container(
              //color: Colors.black,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.home, color: Colors.white,),
                  Text("Name", style:TextStyle(color: Colors.white))
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.account_circle, color: Colors.white,),
                  Text("Attempts", style:TextStyle(color: Colors.white))
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.account_circle, color: Colors.white,),
                  Text("Score", style:TextStyle(color: Colors.white))
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.message, color: Colors.white,),
                  Text("Max Streak", style:TextStyle(color: Colors.white))
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.home, color: Colors.white,),
                  Text("Alan", style:TextStyle(color: Colors.black))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.home, color: Colors.white,),
                  Text("10", style:TextStyle(color: Colors.black))
                ]
              ),
            ),Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.home, color: Colors.white,),
                  Text("150", style:TextStyle(color: Colors.black))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(Icons.home, color: Colors.white,),
                  Text("15", style:TextStyle(color: Colors.black))
                ],
              ),
            ),


            TextButton(

              child: Text('New Game'),
              style: TextButton.styleFrom(

                primary: Colors.white,

                backgroundColor: Colors.teal,

                onSurface: Colors.grey,
                textStyle: TextStyle(

                    color: Colors.black,

                    fontSize:20,

                    fontStyle: FontStyle.italic

                ),

              ),


              onPressed: () {

                print('Pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );

              },


            ),
          ],

          
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        )


    ));
  }
}
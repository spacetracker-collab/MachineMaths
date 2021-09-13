import 'dart:io';

import 'package:flutter/material.dart';
import 'LoadImagePage.dart';
import 'globals.dart' as globals;
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as paths;
import 'dart:typed_data';
import 'package:flutter/services.dart';


class NumberPlate {
  int assetId;
  String imageDigits;

  NumberPlate({
    required this.assetId,
    required this.imageDigits,
  });
}


Future<void> openScoresDb() async{

  var databasesPath = await getDatabasesPath();
  var path = paths.join(databasesPath, "scores_internal.db");

// Check if the database exists
  var exists = await databaseExists(path);
  exists = false; //always copy //todo
  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new score copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(paths.dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(paths.join("assets", "score.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

  } else {
    print("Opening existing database");
  }
// open the database
  globals.scoreDb = await openDatabase(path, readOnly: true);

}


Future<void> openPlatesDb() async{

  var databasesPath = await getDatabasesPath();
  var path = paths.join(databasesPath, "plate_internal.db");

// Check if the database exists
  var exists = await databaseExists(path);
  exists = false; //always copy //todo
  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    // Make sure the parent directory exists
    try {
      await Directory(paths.dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(paths.join("assets", "plate.db"));
    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

  } else {
    print("Opening existing database");
  }
// open the database
  globals.plateDb = await openDatabase(path, readOnly: true);



}


// A method that retrieves all the dogs from the dogs table.
Future<List<NumberPlate>> numberPlates() async {
  // Get a reference to the database.


  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await globals.plateDb!.query('NumberPlate');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return NumberPlate(
      assetId: maps[i]['assetId'],
      imageDigits: maps[i]['imageDigits'],


    );
  });
}

void main() async{



  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.

   await openPlatesDb();
   await openScoresDb();

   print(globals.plateDb.toString()+ ":");
   print(globals.numberPlate.toString()+"**");
  globals.numberPlate = await numberPlates();
  globals.numberPlate.forEach((NumberPlate) {
    globals.maxPlate=0;
    if (NumberPlate.assetId > globals.maxPlate)
    {
      globals.maxPlate = NumberPlate.assetId;
    }
    print(NumberPlate.assetId.toString());
    print(NumberPlate.imageDigits.toString());
   });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Mathematics',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Machine Mathematics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // int _counter = 0;
  final _controller = TextEditingController();
  String val="";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
      _controller.text="Test";
    });
  }

  // user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    String nameOfPlayer = globals.playerName;
    _controller.text=nameOfPlayer;


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
              'Name',
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
                  hintText: "Enter text here",
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10.0)
                  )),

              onChanged: (val) {
                this.val = _controller.text.toString();
                //print(val);
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
                if(globals.playerName.isEmpty) globals.playerName  = _controller.text;
                if(globals.playerName.isEmpty) {
                  this._showDialog();
                }
                else{
                  print('Pressed');
                  Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => LoadImagePage()),
                  );

                }


              },


            ),
          ],
        ),
      ),

    );
  }
}


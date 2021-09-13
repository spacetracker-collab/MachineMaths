library my_prj.globals;
import 'package:sqflite/sqflite.dart';

import 'main.dart';


String equation = "";
String playerName="";
Database? plateDb = null;
Database? scoreDb = null;
List <NumberPlate> numberPlate = new List.empty();
int maxPlate = 0;
int thisPlate =0;
String thisPlateNum = "";

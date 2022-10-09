import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gesture/Screen3.dart';
import 'package:gesture/Screen2.dart';
import 'package:gesture/screen4.dart';

//main function for running the app
void main()
{
  runApp(MyApp());
}
// class of the app and object oriented programming is implemented
// IN FLUTTER EVERYTHING IS IMPLEMENTED IN THE FORM OF WIDGETS
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGVER',
      home: MyHomePage(), //CALL THE MYHOMEPAGE()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() //this is a method for null safety ie. meaning that variables can’t contain null unless you say they can.
  {
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // the whole app layout is called the scaffold
        body: Card(   // this represents the card the widget of the static
          child: Container(                      // the contents in the static card is the container
            height:1000,
            padding: EdgeInsets.fromLTRB(50, 50, 25, 25),// position
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // evenly spacing alignment
              children: [
                Text('Good Morning User',style: TextStyle(fontSize: 20.0),), // using the text widget
                Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                Text('Choose Your Verification Method',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>Screen2()
                    ));
                  },
                  child: Image.asset('assets/rec.png'), // loading the image of the card
                  padding: EdgeInsets.fromLTRB(0,10,1, 5),
                ),
                FlatButton( // loading the button
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>Screen4() // route to the next screen
                    ));
                  },
                  child: Image.asset('assets/hi.png'),
                  padding: EdgeInsets.fromLTRB(0,10,1, 5),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
              ],
            )
          ),
        ),
      );
  }
 }








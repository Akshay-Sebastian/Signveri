import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sigver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? image;
  File? image2;

  Future pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
        maxWidth: 150,
        maxHeight: 150,
      );

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC1() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera, maxWidth: 150, maxHeight: 150);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery,
        maxWidth: 150,
        maxHeight: 150,
      );

      if (image2 == null) return;

      final imageTemp2 = File(image2.path);

      setState(() => this.image2 = imageTemp2);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC2() async {
    try {
      final image2 = await ImagePicker().pickImage(
          source: ImageSource.camera, maxWidth: 150, maxHeight: 150);

      if (image2 == null) return;

      final imageTemp2 = File(image2.path);

      setState(() => this.image2 = imageTemp2);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Scan Images For Static',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: (
                                  MaterialButton(
                                      color: Colors.black,
                                      child: const Text(
                                          "Pick Image from Gallery",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      onPressed: () {
                                        pickImage1();
                                      }
                                  )
                              )),
                          Container(
                            child: (
                                MaterialButton(
                                    color: Colors.black,
                                    child: const Text(
                                        "Pick Image from Camera",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    onPressed: () {
                                      pickImageC1();
                                    }
                                )
                            ),),
                          image != null ? Image.file(image!) : Text("No image selected")
                        ],

                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              child: (
                                  MaterialButton(
                                      color: Colors.black,
                                      child: const Text(
                                          "Pick Image from Gallery",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      onPressed: () {
                                        pickImage2();
                                      }
                                  )
                              )),
                          Container(
                            child: (
                                MaterialButton(
                                    color: Colors.black,
                                    child: const Text(
                                        "Pick Image from Camera",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    onPressed: () {
                                      pickImageC2();
                                    }
                                )
                            ),),
                          image2 != null ? Image.file(image2!) : Text("No image selected"),

                        ],

                      ),
                    ]
                ),
                Container(
                  alignment: Alignment.center,
                  child: (
                      MaterialButton(
                          color: Colors.black,
                          child: const Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          onPressed: () {
                          }
                      )
                  ),),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(10, 10, 25, 150),
                  child: (Text(
                              "Result",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                          )
                      ),
                  ),
              ]
          )
      ),
    );
  }
}
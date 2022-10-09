import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/enums/dtype.dart';

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SIGNSNAP'),
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
  String Generated="x";
  File? image;
  File? image2;
  Model? _imageModel, _customModel;
  String? _imagePrediction;
  List? _prediction;
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel();
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
  Future loadModel() async {
    String pathImageModel = "assets/model.pt";
    try {
      _imageModel = await PyTorchMobile.loadModel(pathImageModel);
    } on PlatformException {
      print("only supported for android and ios so far");
    }
  }
  Future runImageModel() async {
    //pick a random image
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
    final mean = [0.5];
    final std = [0.5];
    String prediction = await _imageModel!.getImagePrediction(File(image!.path), 150, 150, "assets/labels/labels.csv", mean: mean, std: std);
    setState(() {
      image = File(image!.path);
    });
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
                                      onPressed: () {;
                                        runImageModel();

                                      }
                                  )
                              )),

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
                            setState(() {
                              Generated = (Random().nextInt(2)).toString();
                            });
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
                  Container(
                    child: Text('Value Generated: $Generated',style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,),),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                  Container(
                  child: Visibility(
                   visible: _prediction != null,
                  child: Text(_prediction != null ? "${_prediction![0]}" : ""),
                  )),

              ]
          )

      ),
    );
  }
}
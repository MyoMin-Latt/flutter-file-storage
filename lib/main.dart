// @16.1 File storage system in Flutter(Difference OS)
// @16.2 File storage [Temporary and permanent storage]

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('File Storage'),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  saveTemporaryFile('This is temporary file');
                },
                child: Text("Save Temporary File")),
            TextButton(
              onPressed: () async {
                File temp = await temporaryFile();
                String str = await temp.readAsString();
                print(str);
              },
              child: Text('load Temporary File'),
            ),
            TextButton(
                onPressed: () {
                  saveDocFile('This is doc file');
                },
                child: Text("Save doc File")),
            TextButton(
              onPressed: () async {
                File doc = await docFile();
                String str = await doc.readAsString();
                print(str);
              },
              child: Text('load doc File'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<File> temporaryFile() async {
  String path = (await getTemporaryDirectory()).path;
  return File(path + 'myTemp.txt');
}

Future<void> saveTemporaryFile(String str) async {
  File temp = await temporaryFile();
  temp.writeAsString(str);
  print(str);
}

Future<File> docFile() async {
  String path = (await getApplicationDocumentsDirectory()).path;
  return File(path + 'myTemp.txt');
}

Future<void> saveDocFile(String str) async {
  File temp = await docFile();
  temp.writeAsString(str);
  print(str);
}

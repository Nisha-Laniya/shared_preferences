import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'noteslistscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Prefs(),
    );
  }
}

class Prefs extends StatefulWidget {
  const Prefs({Key? key}) : super(key: key);

  @override
  State<Prefs> createState() => _PrefsState();
}

class _PrefsState extends State<Prefs> {
  final notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared preferences'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: notesController,
              decoration: InputDecoration(hintText: 'Enter notes'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setNotesData(notesController.text);
                print(notesController.text);
              },
              child: Text('Save')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotesListScreen()));
              },
              child: Text('View Notes'))
        ],
      ),
    );
  }

  Future<void> setNotesData(noteValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('noteData', noteValue);
  }
}

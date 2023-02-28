import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List Screen'),
      ),
      body: Center(
        child: noteValue == null ? Text('Notes Unavailable') : Text(noteValue!),
      ),
    );
  }

  void getNotes() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    noteValue = prefs.getString('noteData');
    setState(() {

    });
  }
}

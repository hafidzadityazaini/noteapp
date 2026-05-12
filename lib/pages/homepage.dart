import 'package:flutter/material.dart';
import 'package:noteapp/models/notemodel.dart';
import 'package:noteapp/pages/notepage.dart';
import 'package:noteapp/service/databasehelper.dart';
import 'package:noteapp/theme/apptheme.dart';
import 'package:noteapp/widgets/confirmdialog.dart';
import 'package:noteapp/widgets/notecard.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:noteapp/utils/dialogs.dart';


class Homepage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const Homepage({super.key, required this.onToggleTheme});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Note> notes = [];

  Future<void> loadNotes() async {
   final data = await DatabaseHelper.instance.getAllNotes();

    setState(() {
    notes = data;
  });
  }



//   void addNote(Note note) {
//     setState(() {
//       notes.add(note);
//     });
//   }

//   void updateNote(int index, Note note) {
//     setState(() {
//       notes[index] = note;
//     });
//   }

//   void deleteNote(int index) async{
//     bool confirm = await showConfirmDialog(context);
//     if (confirm){
//       setState(() {
//       notes.removeAt(index);
//     });
//   }
// }

  void goToNotePage({Note? note}) async {
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (_) => NotePage(note: note)),
      );

        if (result == "delete" && note?.id != null){
          await DatabaseHelper.instance.deleteNote(note!.id!);
          await loadNotes();
        } else if(result is Note && note !=null){
          await DatabaseHelper.instance.updateNote(result);
          await loadNotes();
        } else if (result is Note){
          await DatabaseHelper.instance.insertNote(result);
          await loadNotes();
        }
  }

  @override
  void initState(){
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),

      backgroundColor: theme.scaffoldBackgroundColor,
      body: notes.isEmpty
        ?  Center(
          child: Text(
            "No Notes",
            style: theme.textTheme.bodyMedium,
          ),
        )
        : GridView.builder(
          padding:  const EdgeInsets.all(12),
          itemCount: notes.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes[index],
              onEdit: () => goToNotePage(note: notes[index], ),
              onDelete: () => goToNotePage(note: notes[index],)
              );
          },
        ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToNotePage(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
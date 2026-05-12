import 'package:flutter/material.dart';
import 'package:noteapp/models/notemodel.dart';

class NotePage extends StatefulWidget {
  final Note? note;

  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final authorController = TextEditingController();

  bool _isSaving = false;

  // INIT
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  // DISPOSE
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    authorController.dispose();
    super.dispose();
  }

  // SAVE NOTE
  void saveNote() {
    if (_isSaving) return;
    _isSaving = true;

    if (!mounted) return;

    // VALISADI INPUT
    if (titleController.text.trim().isEmpty &&
        contentController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    final now = DateTime.now().toIso8601String();

    final note = Note(
      id: widget.note?.id,
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now
    );

    Navigator.pop(context, note);
  }

  // DELETE
  void deleteNote() async {
    final navigator = Navigator.of(context);

    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm"),
        content: Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Delete"),
          ),
        ],
      ),
    );

    if(!mounted) return;

    if (confirm == true) {
      // ignore: Use_build_context_synchronously
      Navigator.pop(context, "delete");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: PopScope(
      
        canPop: false,
      
        onPopInvokedWithResult: (didPop, result) {
          if(didPop || _isSaving) return;
      
          saveNote();
        },
      
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: saveNote, // auto save ketika back
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              if(widget.note != null)
                IconButton(
                  onPressed: deleteNote,
                  icon: Icon(Icons.delete),
                ),
            ],
          ),
        
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                // TITLE
                TextField(
                  controller: titleController,
                  autofocus: true,
                  style: theme.textTheme.titleLarge,
                  decoration: const InputDecoration(
                    hintText: "Judul",
                    border: InputBorder.none,
                  ),
                ),
      
                const SizedBox(height: 6),
        
                // CONTENT
                Expanded(
                  child: TextField(
                    controller: contentController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: "Text Note",
                      border: InputBorder.none,
                    ),
                  ),
                ),
        
                // DIVIDER
                Divider(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
                ),
      
                const SizedBox(height: 6),
        
                // AUTHOR
                TextField(
                  controller: authorController,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: "distributed by",
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

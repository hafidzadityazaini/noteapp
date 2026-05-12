import 'package:flutter/material.dart';
import 'package:noteapp/models/notemodel.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onEdit,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.disabledColor.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: theme.textTheme.titleLarge, 
              maxLines: 2, overflow: TextOverflow.ellipsis
              ),

            const SizedBox(height: 6),

            Expanded(
              child: Text(
                note.content,
                style: theme.textTheme.bodyMedium, 
                maxLines: 6, 
                overflow: TextOverflow.ellipsis
                ),
            ),

            const SizedBox(height: 8),

            Text(
              note.author, 
              style: theme.textTheme.bodySmall,
              maxLines: 1, 
              overflow: TextOverflow.ellipsis
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    Icons.delete,
                    size: 18,
                    color: theme.colorScheme.error,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
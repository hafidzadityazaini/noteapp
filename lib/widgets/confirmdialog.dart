import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Confirm'),
      content: const Text('Are you sure?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('OK'),
        ),
      ],
    ),
  ) ??
  false;
}
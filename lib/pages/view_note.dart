import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  ViewNote(this.documentSnapshot, {super.key});
  QueryDocumentSnapshot documentSnapshot;
  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.documentSnapshot['title'],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.documentSnapshot['content'],
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

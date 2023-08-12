
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/note_cubits/note_cubit.dart';

class EditNote extends StatelessWidget {
  final TextEditingController _newTitleController = TextEditingController();
  final TextEditingController _newContentController = TextEditingController();

  EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _newTitleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Title',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: _newContentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Content',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          context.read<NoteCubit>().addNote(
            title: _newTitleController.text,
            content: _newContentController.text,
          );
          Navigator.pop(context);
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

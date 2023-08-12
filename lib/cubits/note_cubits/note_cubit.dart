import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  NoteCubit() : super(NoteInitialState());

  Future<void> fetchNotes() async {
    try {
      emit(NoteLoadingState());

      final notes = await firestore.collection('Note').get();

      emit(NoteLoadedState(notes.docs));
    } catch (err) {
      emit(NoteError(err.toString()));
    }
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    try {
      await firestore.collection('Note').add({
        'title': title,
        'content': content,
      });

      emit(NoteAddedState());
    } catch (err) {

      emit(NoteError(err.toString()));
    }
  }
}

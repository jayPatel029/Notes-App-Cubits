part of 'note_cubit.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NoteInitialState extends NoteState {}

class NoteLoadingState extends NoteState {}

class NoteLoadedState extends NoteState {

  final List<QueryDocumentSnapshot> notes;

  const NoteLoadedState(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NoteAddedState extends NoteState {}

class NoteError extends NoteState {
  final String error;

  const NoteError(this.error);

  @override
  List<Object?> get props => [error];
}

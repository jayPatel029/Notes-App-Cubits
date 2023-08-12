// // import 'package:banao_notes_task_3/pages/view_note.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../cubits/note_cubits/note_cubit.dart';
// // import '../widgets/card_notes.dart';
// // import 'edit_note.dart';
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<NoteCubit,   NoteState>(
// //       builder: (context, state) {
// //         if (state is NoteLoadingState) {
// //           return const Center(child: CircularProgressIndicator());
// //         } else if (state is NoteLoadedState) {
// //           final noteList = state.notes
// //               .map((newNote) => note_card(
// //                     () => Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => ViewNote(newNote),
// //                       ),
// //                     ),
// //                     newNote,
// //                   ))
// //               .toList();
// //
// //           return Scaffold(
// //             appBar: AppBar(
// //               centerTitle: true,
// //               title: const Text('Home Page'),
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.all(14.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     "Notes",
// //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   Expanded(
// //                     child: ListView(
// //                       children: noteWidgets,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             floatingActionButton: FloatingActionButton.extended(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => EditNote()),
// //                 );
// //               },
// //               label: const Text("Add note"),
// //               icon: const Icon(Icons.add),
// //               elevation: 0.0,
// //             ),
// //           );
// //         } else if (state is NoteError) {
// //           return Scaffold(
// //             appBar: AppBar(
// //               centerTitle: true,
// //               title: const Text('Home Page'),
// //             ),
// //             body: Center(child: Text('Error: ${state.error}')),
// //             floatingActionButton: FloatingActionButton.extended(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => EditNote()),
// //                 );
// //               },
// //               label: const Text("Add note"),
// //               icon: const Icon(Icons.add),
// //               elevation: 0.0,
// //             ),
// //           );
// //         } else {
// //           // initial note state / after adding a note
// //
// //           context.read<NoteCubit>().fetchNotes();
// //           return Scaffold(
// //             appBar: AppBar(
// //               centerTitle: true,
// //               title: const Text('Home Page'),
// //             ),
// //             body: const Center(child: CircularProgressIndicator()),
// //             floatingActionButton: FloatingActionButton.extended(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => EditNote()),
// //                 );
// //               },
// //               label: const Text("Add note"),
// //               icon: const Icon(Icons.add),
// //               elevation: 0.0,
// //             ),
// //           );
// //         }
// //       },
// //     );
// //   }
// // }
// //
// //
//
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubits/note_cubits/note_cubit.dart';
// import '../widgets/card_notes.dart';
// import 'edit_note.dart';
// import 'view_note.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     void _navigateToEditNote() async {
//       final result = await Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => EditNote()),
//       );
//
//       if (result == true) {
//         context.read<NoteCubit>().fetchNotes(); // Refresh the notes
//       }
//     }
//
//
//
//
//     return BlocBuilder<NoteCubit, NoteState>(
//       builder: (context, state) {
//         if (state is NoteLoadingState || state is NoteInitialState) {
//           context.read<NoteCubit>().fetchNotes();
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: const Text('Home Page'),
//             ),
//             body: const Center(child: CircularProgressIndicator()),
//             floatingActionButton: FloatingActionButton.extended(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditNote()),
//                 );
//               },
//               label: const Text("Add note"),
//               icon: const Icon(Icons.add),
//               elevation: 0.0,
//             ),
//           );
//         } else if (state is NoteError) {
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: const Text('Home Page'),
//             ),
//             body: Center(child: Text('Error: ${state.error}')),
//             floatingActionButton: FloatingActionButton.extended(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditNote()),
//                 );
//               },
//               label: const Text("Add note"),
//               icon: const Icon(Icons.add),
//               elevation: 0.0,
//             ),
//           );
//         } else if (state is NoteLoadedState) {
//           final noteWidgets = state.notes.map((newNote) =>
//               note_card(() => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => ViewNote(newNote))),
//                   newNote)).toList();
//
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: const Text('Home Page'),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Notes",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Expanded(
//                     child: ListView(
//                       children: noteWidgets,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButton: FloatingActionButton.extended(
//               onPressed: _navigateToEditNote,
//
//               //     () {
//               //   Navigator.push(
//               //     context,
//               //     MaterialPageRoute(builder: (context) => EditNote()),
//               //   );
//               // },
//               label: const Text("Add note"),
//               icon: const Icon(Icons.add),
//               elevation: 0.0,
//             ),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }



import 'package:banao_notes_task_3/pages/view_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/note_cubits/note_cubit.dart';
import '../widgets/card_notes.dart';
import 'edit_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NoteLoadedState) {
          final noteWidgets = state.notes
              .map((newNote) => note_card(
                () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewNote(newNote),
              ),
            ),
            newNote,
          ))
              .toList();

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Home Page'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Notes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                      children: noteWidgets,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditNote()),
                );
              },
              label: const Text("Add note"),
              icon: const Icon(Icons.add),
              elevation: 0.0,
            ),
          );
        } else if (state is NoteError) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Home Page'),
            ),
            body: Center(child: Text('Error: ${state.error}')),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditNote()),
                );
              },
              label: const Text("Add note"),
              icon: const Icon(Icons.add),
              elevation: 0.0,
            ),
          );
        } else {
          // initial state / after adding a note state
          context.read<NoteCubit>().fetchNotes();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Home Page'),
            ),
            body: const Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditNote()),
                );
              },
              label: const Text("Add note"),
              icon: const Icon(Icons.add),
              elevation: 0.0,
            ),
          );
        }
      },
    );
  }
}


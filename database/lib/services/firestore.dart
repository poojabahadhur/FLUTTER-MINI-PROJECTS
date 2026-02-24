import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Collection reference
  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  // CREATE: add a new note
  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  // READ: get notes stream
  Stream<QuerySnapshot> getNotesStream() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  // UPDATE: update note by docID
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete note by docID
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}

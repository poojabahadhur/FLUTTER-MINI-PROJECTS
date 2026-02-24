import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Firestore service
final FirestoreService firestoreService = FirestoreService();

// Text controllers
final TextEditingController textcontroller = TextEditingController();
final TextEditingController updatecontroller = TextEditingController();

class _HomePageState extends State<HomePage> {
  // Add Note Dialog
  void openDailogBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add a Note"),
        content: TextField(
          controller: textcontroller,
          decoration: const InputDecoration(
            hintText: "Enter your note",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (textcontroller.text.isNotEmpty) {
                firestoreService.addNote(textcontroller.text);
                textcontroller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
          ElevatedButton(
            onPressed: () {
              textcontroller.clear();
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // Update Note Dialog
  void updateDailogBox(String docID, String currentNote) {
    updatecontroller.text = currentNote; // preload current note
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update a Note"),
        content: TextField(
          controller: updatecontroller,
          decoration: const InputDecoration(
            hintText: "Enter your note",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (updatecontroller.text.isNotEmpty) {
                firestoreService.updateNote(docID, updatecontroller.text);
                updatecontroller.clear();
                Navigator.pop(context);
              }
            },
            child: const Text("Update"),
          ),
          ElevatedButton(
            onPressed: () {
              updatecontroller.clear();
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Notes"))),
      floatingActionButton: FloatingActionButton(
        onPressed: openDailogBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          updateDailogBox(docID, noteText); // ⚡ fixed
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          firestoreService.deleteNote(docID);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading notes"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

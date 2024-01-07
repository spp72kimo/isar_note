import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_note/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  // * INITIAL DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  // * list of notes
  final List<Note> currentNotes = [];

  // * CREATE
  Future<void> addNote(String text) async {
    final newNote = Note()..text = text;
    await isar.writeTxn(() => isar.notes.put(newNote));
    fetchNote();
  }

  // * READ
  Future<void> fetchNote() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // * UPDATE
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNote();
    }
  }

  // * DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }
}

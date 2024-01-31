import 'package:flutter_data/models/note.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_data/db/db_helper.dart';

class HomeController extends GetxController {
  Database db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void createNote() async {
    var newNote = await Get.toNamed("/create");
    newNote = newNote as Note?;

    if (newNote != null) {
      await db.insert("Notes", newNote.toMap());
      getNotes();
    }
  }

  void deleteNote(int id) async {
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void updateNote(int index) async {
    var newNote = await Get.toNamed("/create", arguments: notes[index]);
    newNote = newNote as Note?;

    if (newNote != null) {
      await db.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }
}

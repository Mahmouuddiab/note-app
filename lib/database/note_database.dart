import 'package:note_app/model/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteDatabase{
  final dataBase=Supabase.instance.client.from("notes");

  // create note
    Future createNote(String content)async{
    await dataBase.insert({'content':content});
  }

  // read note from supabase
  Future<List<Note>> getNotes() async {
    final response = await Supabase.instance.client
        .from('notes')
        .select()
        .order('created_at', ascending: false);

    return (response as List).map((item) => Note.fromJson(item)).toList();
  }
  // update note
  Future updateNote(int id,String newContent)async{
    await dataBase.update({'content':newContent}).eq('id', id);
  }

  // delete note
  Future deleteNote(int id)async{
    await dataBase.delete().eq('id',id);
  }
}
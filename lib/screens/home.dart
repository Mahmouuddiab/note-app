import 'package:flutter/material.dart';
import 'package:note_app/database/note_database.dart';

class Home extends StatelessWidget {
   Home({super.key});
   TextEditingController noteController=TextEditingController();
   TextEditingController updateController=TextEditingController();
   NoteDatabase noteDatabase=NoteDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Notes",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("New Note"),
                  content: TextField(
                    controller: noteController,
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      noteController.clear();
                    }, child: Text("cancel")),
                    TextButton(onPressed: (){
                      noteDatabase.createNote(noteController.text);
                      Navigator.pop(context);
                      noteController.clear();
                    }, child: Text("ok"))
                  ],
                ),);
          },
        child: Icon(Icons.add,size: 25,),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: noteDatabase.getNotes(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            final notes = snapshot.data!;
            return ListView.builder(
              itemCount: notes.length,
                itemBuilder: (context, index) {
                final note=notes[index];
                  return ListTile(
                    title: Text(note.content,style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("update note"),
                                    content: TextField(
                                      controller: updateController,
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                        updateController.clear();
                                      }, child: Text("cancel")),
                                      TextButton(onPressed: (){
                                        noteDatabase.updateNote(note.id, updateController.text);
                                        Navigator.pop(context);
                                        updateController.clear();
                                      }, child: Text("ok"))
                                    ],
                                  ),
                              );
                            },
                              child: Icon(Icons.edit)
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: () => noteDatabase.deleteNote(note.id),
                              child: Icon(Icons.delete,color: Colors.red,)
                          ),
                        ],
                      ),
                    ),
                  );
                },
            ) ;
          },
      ),
    );
  }
}

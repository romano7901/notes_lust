import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List notesList =[];
  String _userNote = '';
  
  @override 
  void initState() {
    super.initState();
    notesList.addAll(['тестовая запись 1','проверка разметки ',' совсем совсем совсем ',' проверка проверки всегда ',' тест']);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список заметок'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(notesList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(notesList[index]),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            notesList.removeAt(index);
                          });
                        },
                       icon: Icon(
                         Icons.delete_forever,
                         color: Colors.red
                       ),
                      ),
                  ),

                ),
                onDismissed: (direction) {
                  setState(() {
                    notesList.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить ноту'),
              content: TextField(
                onChanged:(String value) {

                    _userNote = value;

                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    notesList.add(_userNote);
                  });
                  Navigator.of(context).pop();
                },
                    child: Text('Саве'))
              ],
            );
          });
        },
        child: Icon(
          Icons.exposure_plus_1_sharp,
          color: Colors.greenAccent
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: ToDoListPage(),
    ),
  );
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {

  List todo = [];
  String input;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Список дел',
            style: GoogleFonts.openSans(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              textStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(todo[index]),
            child: TextButton(
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: ListTile(
                  title: Text(
                    todo[index],
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      textStyle: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        todo.remove(todo[index]);
                      });
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Добавить задание',
                  style: GoogleFonts.openSans(),
                ),
                content: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Вставьте текст...',
                    hintStyle: GoogleFonts.openSans(),
                  ),
                  onChanged: (value) {
                    input = value;
                  },
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (input != null) {
                          todo.add(input);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }
}

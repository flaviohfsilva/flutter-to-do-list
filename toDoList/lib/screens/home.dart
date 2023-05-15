import 'package:flutter/material.dart'; // import padrão do flutter
import '../model/todo.dart';
import '../constants/colors.dart'; //import de cores, criei um novo arquivo dart
import '../widget/todoItem.dart';


class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.toDoList();
  List<ToDo> foundToDo = [];
  final todoController = TextEditingController();

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), // método AppBar
      backgroundColor: tdBGColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          "Lista de Afazeres",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for(ToDo list in foundToDo)
                        ToDoItem(
                          todo: list,
                          onToDoChanged: _changeToDo,
                          onDeletedToDo: _deleteToDo,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                        hintText: "Adicione uma nova tarefa",
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    "+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDo(todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColor,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }


  void _changeToDo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDo(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String toDo){
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ),
      );
    });

    todoController.clear();
  }

  void searchFilter(String keyword){
    List<ToDo>  results = [];
    if(keyword.isEmpty){
      results = todosList;
    }else{
      results = todosList.
      where((item) => item.todoText!.toLowerCase()
          .contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      foundToDo = results;
    });
  }


  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => searchFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 25,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: "Pesquisa",
            hintStyle: TextStyle(color: tdBlack)
        ),
      ),
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0, // tira a sombra
      title: Row( // como se fosse o display flex, deixa tudo um do lado do outro
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // como se fosse um justify-content, separando os icons
          children: const [ // filho do row em que foi colocado dois icons
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Icon(
              Icons.person,
              color: tdBlack,
              size: 30,
            )
          ]),
    );
  }
}


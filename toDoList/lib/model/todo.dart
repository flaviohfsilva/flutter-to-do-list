//Linguaguem Dart
class ToDo{ //Criação da classe e declaração dos atributos
  String? id;
  String? todoText;
  bool isDone;

  ToDo({  //declarando o construtor
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

    static List<ToDo> toDoList(){  //método
      return [
        ToDo( id: "01", todoText: "Limpar quintal", isDone: true),
        ToDo( id: "02", todoText: "Limpar o quarto", isDone: true),
        ToDo( id: "03", todoText: "Lavar o banheiro",),
        ToDo( id: "04", todoText: "Fazer as atividades da faculdade", ),

      ];
    }
}



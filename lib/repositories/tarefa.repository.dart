import 'package:tarefas/models/tarefa.model.dart';


class TarefaRepository {
  static List<Tarefa> tarefas = List<Tarefa>();

  TarefaRepository() {
    if (tarefas.isEmpty){
      tarefas.add(Tarefa(id : "1", texto : "Estudar", finalizada : false));
      tarefas.add(Tarefa(id : "2", texto : "Jogar", finalizada : true));
      tarefas.add(Tarefa(id : "3", texto : "Vapo", finalizada : false));
      
    }
  }

  void create(Tarefa tarefa) {
    tarefas.add(tarefa);
  }

  List<Tarefa> read(){
    return tarefas;
  }
}

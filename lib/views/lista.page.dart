import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarefas/models/tarefa.model.dart';
import 'package:tarefas/repositories/tarefa.repository.dart';
import 'package:tarefas/views/nova.page.dart';


class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final TarefaRepository repository = TarefaRepository();

  List<Tarefa> tarefas;

  @override
  initState() {
    super.initState();
    this.tarefas = repository.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE TAREFAS"),
        centerTitle: true,
        leading: Builder(
         builder: (BuildContext context) {
          return IconButton(
          icon: const Icon(
            Icons.dehaze,
            color: Colors.black87,
          ),
          tooltip: "MENU",
         );
        },
       ),
      ),
      body: ListView.builder(
        itemCount: repository.read().length,
        itemBuilder: (_, indice){
          var tarefa = this.tarefas[indice];
          return CheckboxListTile (
            value: tarefa.finalizada,
            onChanged: (value) {
              setState(() => tarefa.finalizada = value);
            },
            title: Text(tarefa.texto,
              style: TextStyle(       // ? = se : = senao
                decoration: tarefa.finalizada ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          );
        },
       ), //criar lista com dados do read()
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NovaPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),  
    );
  }
}
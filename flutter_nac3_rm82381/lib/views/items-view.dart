
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_nac3_rm82381/models/selecao.dart';
import 'package:flutter_nac3_rm82381/services/time.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  var _selecaoService = SelecaoService();
  List<Selecao> items = [];

  @override
  void initState() {
    _selecaoService.findAll().then(
      (value) {
        setState(
          () {
            items = value;
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text('Nac 3 - Flutter');
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          //final items = buscar todos;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemCount: items.length,
              itemBuilder: (_, int index) {
                final item = items[index];
                return Observer(
                  builder: (_) {
                    return Dismissible(
                      onDismissed: (direction) {
                        //remover o item
                      },
                      key: UniqueKey(),
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        color: Colors.blue[200],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              height: 100,
                              width: 100,
                              color: Colors.blueAccent,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Nome: Nome da Seleção',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Publico: '),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        // diminuir a quantidade
                                      },
                                    ),
                                    Text('2'), // Quantidade
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        // aumentar a quantidade
                                      },
                                    )
                                  ],
                                ),
                                Text("Publico Total: 80.850"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

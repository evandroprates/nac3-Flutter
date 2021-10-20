import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_nac3_rm82381/models/selecao.dart';
import 'package:flutter_nac3_rm82381/services/time.dart';

import 'items-view.dart';

class SelecaoView extends StatefulWidget {
  @override
  _SelecaoViewState createState() => _SelecaoViewState();
}

class _SelecaoViewState extends State<SelecaoView> {
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
            return Text("Nac 3 - Flutter");
          },
        ),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => ItemsView(),
                    ),
                  );
                },
                child: new Stack(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.mobile_friendly,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                    Positioned(
                      child: new Stack(
                        children: <Widget>[
                          new Icon(
                            Icons.brightness_1,
                            size: 20.0,
                            color: Colors.green[100],
                          ),
                          new Positioned(
                            top: 3.0,
                            right: 6.0,
                            child: new Center(
                              child: Observer(
                                builder: (_) {
                                  return new Text(
                                    '2',
                                    style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          //final items = busca todos;
          return RefreshIndicator(
            onRefresh: () async {
              // Código de reload;
            },
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, int index) {
                final selecao = items[index];
                return Observer(
                  builder: (_) {
                    return ListTile(
                      leading: const Icon(
                        Icons.people,
                        color: Colors.purple,
                      ),
                      onTap: () {},
                      title: Text("${selecao.nomeSelecao}"),
                      subtitle: Text(
                        "Record Publico ${selecao.recordePublico}",
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
        child: const Icon(Icons.plus_one),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => ItemsView(),
            ),
          );
        },
      ),
    );
  }
}

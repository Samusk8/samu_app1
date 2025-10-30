import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNombres = [];
  int _ultimo = 0;
  ScrollController _sc = new ScrollController();
  bool _estaCargando = false;

  @override
  void initState() {
    super.initState();
    _cargarNuevo();
    _sc.addListener(() {
      print(_sc.position.pixels);
      if (_sc.position.atEdge) {
        if (_sc.position.pixels == 0) {
          print('inicio');
        } else {
          print('final');
          _cargarNuevo();
        }
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas y Scroll'), elevation: 2),
      body: Stack(children: [_crearLista(), _crearLoading()]),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _sc,
        itemCount: _listaNombres.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNombres[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${imagen}/400/300'),
          );
        },
      )
    );

  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      // Purgam la llista de nombres
      _listaNombres.clear();
      _ultimo++;
      _cargarNuevo();
    });
    return Future.delayed(duration);
  }

  void _cargarNuevo() {
    for (int i = 0; i < 5; i++) {
      _listaNombres.add(_ultimo);
      _ultimo++;
    }
    setState(() {});
  }

  Future<Timer> fetchData() async {
    _estaCargando = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return Timer(duration, peticioHTTP);
  }

  void peticioHTTP() {
    _estaCargando = false;
    _cargarNuevo();
    _sc.animateTo(
      _sc.position.pixels + 100,
      duration: Duration(microseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _crearLoading() {
    if (_estaCargando) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 20),
        ],
      );
    } else {
      return Container();
    }
  }
}

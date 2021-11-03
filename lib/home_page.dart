import 'dart:convert';

import 'package:consumindo_api/API.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //cria uma lista para pegar os dados da classe api
  List<Api> _api;

//metodo futuro para pegar os dados do usuario
  Future<List<Api>> _getUser() async {
    //cria uma condição se for try = verdadeiro, catch = false
    try {
      // se for verdade pega a lista do usuario com as respostas vindo da url da api
      List<Api> listUser = List();
      final response =
          await http.get('https://jsonplaceholder.typicode.com/users');
      //condicao para q se o status da resposta fo ok =200
      if (response.statusCode == 200) {
        var descodeJson = jsonDecode(response.body);
        //esse for serve para pegar cada requisição e colocar dentro da lista para dps passar para api
        descodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
        return listUser;
      } else {
        print("Erro ao carregar list");
        return null;
      }
    } catch (e) {
      print("Erro ao carregar list");
      return null;
    }
  }

  //essa função força inicar primeiro o que acontece dentro desse bloco
  @override
  void initState() {
    super.initState();
    _getUser().then((map) {
      _api = map;
      print(_api.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _api.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 80,
                color: Colors.blue,
                //passando os parametros da api para o campo de texto
                child: Text(_api[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}

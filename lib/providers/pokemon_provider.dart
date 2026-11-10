import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {

  String _baseUrl = 'https://pokeapi.co/';
  String _offset = '0';
  String _limit = '151';

  List<Pokemon> OnDisplayPokemon = [];

  PokemonProvider() {
    print('Pokemon Provider inicialitzat');
    this.getOnDisplayPokemon();
  }

  getOnDisplayPokemon() async {
    print('getOnDisplayPokemon');
    var url = Uri.https(_baseUrl, 'https://pokeapi.co/api/v2/pokemon', {
      'offset': _offset,
      'limit': _limit
    });
  }

}
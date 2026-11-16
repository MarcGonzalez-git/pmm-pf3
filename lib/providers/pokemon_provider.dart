import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/pokemon.dart';
import 'package:movies_app/models/pokemon_response.dart';

class PokemonProvider extends ChangeNotifier {

  String _baseUrl = 'pokeapi.co';
  String _limit = '151';
  String _offset = '0';

  List<Result> OnDisplayPokemon = [];
  List<Pokemon> OnDisplayPokemonDetails = [];

  PokemonProvider() {
    print('Pokemon Provider inicialitzat');
    this.getOnDisplayPokemon();
  }

  getOnDisplayPokemon() async{
    print('getOnDisplayPokemon');
    var url = Uri.https(_baseUrl, '/api/v2/pokemon', {
      'limit': _limit,
      'offset': _offset
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = PokemonResponse.fromJson(response.body);

      OnDisplayPokemon = jsonResponse.results;

      for (var pokemon in OnDisplayPokemon) {

        final responsePokemon = await http.get(Uri.parse(pokemon.url));

        if (responsePokemon.statusCode == 200) {
          final pokemonDetails = Pokemon.fromJson(responsePokemon.body);

          OnDisplayPokemonDetails.add(pokemonDetails);
        }
      }

      print('Pokemon obtinguts: ${OnDisplayPokemonDetails.length}');
      print('Primer Pokemon: ${OnDisplayPokemonDetails[0].name}');

      notifyListeners();
    }

  }

}
import 'dart:convert';

class PokemonResponse {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    PokemonResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory PokemonResponse.fromJson(String str) => PokemonResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonResponse.fromMap(Map<String, dynamic> json) => PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}

class Result {
    String name;
    String url;

    Result({
        required this.name,
        required this.url,
    });

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}
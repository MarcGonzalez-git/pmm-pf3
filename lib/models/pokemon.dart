import 'dart:convert';

class Pokemon {
    int id;
    String name;
    int baseExperience;
    int height;
    bool isDefault;
    int order;
    int weight;
    List<Ability> abilities;
    List<PastAbility> pastAbilities;
    List<Species> forms;
    List<GameIndex> gameIndices;
    List<HeldItem> heldItems;
    String locationAreaEncounters;
    List<Move> moves;
    Species species;
    Sprites sprites;
    Cries cries;
    List<Stat> stats;
    List<PastStat> pastStats;
    List<Type> types;
    List<dynamic> pastTypes;

    Pokemon({
        required this.id,
        required this.name,
        required this.baseExperience,
        required this.height,
        required this.isDefault,
        required this.order,
        required this.weight,
        required this.abilities,
        required this.pastAbilities,
        required this.forms,
        required this.gameIndices,
        required this.heldItems,
        required this.locationAreaEncounters,
        required this.moves,
        required this.species,
        required this.sprites,
        required this.cries,
        required this.stats,
        required this.pastStats,
        required this.types,
        required this.pastTypes,
    });

    factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        isDefault: json["is_default"],
        order: json["order"],
        weight: json["weight"],
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
        pastAbilities: List<PastAbility>.from(json["past_abilities"].map((x) => PastAbility.fromMap(x))),
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromMap(x))),
        heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromMap(x))),
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        cries: Cries.fromMap(json["cries"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        pastStats: List<PastStat>.from(json["past_stats"].map((x) => PastStat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x.toMap())),
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toMap())),
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "cries": cries.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
        "past_stats": List<dynamic>.from(pastStats.map((x) => x.toMap())),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    };
}

class Ability {
    bool isHidden;
    int slot;
    Species? ability;

    Ability({
        required this.isHidden,
        required this.slot,
        required this.ability,
    });

    factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        ability: json["ability"] == null ? null : Species.fromMap(json["ability"]),
    );

    Map<String, dynamic> toMap() => {
        "is_hidden": isHidden,
        "slot": slot,
        "ability": ability?.toMap(),
    };
}

class Species {
    String name;
    String url;

    Species({
        required this.name,
        required this.url,
    });

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Cries {
    String latest;
    String legacy;

    Cries({
        required this.latest,
        required this.legacy,
    });

    factory Cries.fromJson(String str) => Cries.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cries.fromMap(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
    );

    Map<String, dynamic> toMap() => {
        "latest": latest,
        "legacy": legacy,
    };
}

class GameIndex {
    int gameIndex;
    Species version;

    GameIndex({
        required this.gameIndex,
        required this.version,
    });

    factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version.toMap(),
    };
}

class HeldItem {
    Species item;
    List<VersionDetail> versionDetails;

    HeldItem({
        required this.item,
        required this.versionDetails,
    });

    factory HeldItem.fromJson(String str) => HeldItem.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HeldItem.fromMap(Map<String, dynamic> json) => HeldItem(
        item: Species.fromMap(json["item"]),
        versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "item": item.toMap(),
        "version_details": List<dynamic>.from(versionDetails.map((x) => x.toMap())),
    };
}

class VersionDetail {
    int rarity;
    Species version;

    VersionDetail({
        required this.rarity,
        required this.version,
    });

    factory VersionDetail.fromJson(String str) => VersionDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionDetail.fromMap(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "rarity": rarity,
        "version": version.toMap(),
    };
}

class Move {
    Species move;
    List<VersionGroupDetail> versionGroupDetails;

    Move({
        required this.move,
        required this.versionGroupDetails,
    });

    factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "move": move.toMap(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
    };
}

class VersionGroupDetail {
    int levelLearnedAt;
    Species versionGroup;
    Species moveLearnMethod;
    int? order;

    VersionGroupDetail({
        required this.levelLearnedAt,
        required this.versionGroup,
        required this.moveLearnMethod,
        required this.order,
    });

    factory VersionGroupDetail.fromJson(String str) => VersionGroupDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        versionGroup: Species.fromMap(json["version_group"]),
        moveLearnMethod: Species.fromMap(json["move_learn_method"]),
        order: json["order"],
    );

    Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "version_group": versionGroup.toMap(),
        "move_learn_method": moveLearnMethod.toMap(),
        "order": order,
    };
}

class PastAbility {
    Species generation;
    List<Ability> abilities;

    PastAbility({
        required this.generation,
        required this.abilities,
    });

    factory PastAbility.fromJson(String str) => PastAbility.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PastAbility.fromMap(Map<String, dynamic> json) => PastAbility(
        generation: Species.fromMap(json["generation"]),
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "generation": generation.toMap(),
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
    };
}

class PastStat {
    Species generation;
    List<Stat> stats;

    PastStat({
        required this.generation,
        required this.stats,
    });

    factory PastStat.fromJson(String str) => PastStat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PastStat.fromMap(Map<String, dynamic> json) => PastStat(
        generation: Species.fromMap(json["generation"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "generation": generation.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
    };
}

class Stat {
    int baseStat;
    int effort;
    Species stat;

    Stat({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
    );

    Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toMap(),
    };
}

class GenerationViii {
    Sprites swordShield;
    Sprites legendsArceus;
    Sprites brilliantDiamondShiningPearl;

    GenerationViii({
        required this.swordShield,
        required this.legendsArceus,
        required this.brilliantDiamondShiningPearl,
    });

    factory GenerationViii.fromJson(String str) => GenerationViii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        swordShield: Sprites.fromMap(json["sword-shield"]),
        legendsArceus: Sprites.fromMap(json["legends-arceus"]),
        brilliantDiamondShiningPearl: Sprites.fromMap(json["brilliant-diamond-shining-pearl"]),
    );

    Map<String, dynamic> toMap() => {
        "sword-shield": swordShield.toMap(),
        "legends-arceus": legendsArceus.toMap(),
        "brilliant-diamond-shining-pearl": brilliantDiamondShiningPearl.toMap(),
    };
}

class GenerationVii {
    DreamWorld icons;
    Sprites ultraSunUltraMoon;
    Sprites letsGoPikachuLetsGoEevee;

    GenerationVii({
        required this.icons,
        required this.ultraSunUltraMoon,
        required this.letsGoPikachuLetsGoEevee,
    });

    factory GenerationVii.fromJson(String str) => GenerationVii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: Sprites.fromMap(json["ultra-sun-ultra-moon"]),
        letsGoPikachuLetsGoEevee: Sprites.fromMap(json["lets-go-pikachu-lets-go-eevee"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toMap(),
        "lets-go-pikachu-lets-go-eevee": letsGoPikachuLetsGoEevee.toMap(),
    };
}

class GenerationVi {
    Sprites xY;
    DreamWorld icons;
    Sprites omegaRubyAlphaSapphire;

    GenerationVi({
        required this.xY,
        required this.icons,
        required this.omegaRubyAlphaSapphire,
    });

    factory GenerationVi.fromJson(String str) => GenerationVi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVi.fromMap(Map<String, dynamic> json) => GenerationVi(
        xY: Sprites.fromMap(json["x-y"]),
        icons: DreamWorld.fromMap(json["icons"]),
        omegaRubyAlphaSapphire: Sprites.fromMap(json["omega-ruby-alpha-sapphire"]),
    );

    Map<String, dynamic> toMap() => {
        "x-y": xY.toMap(),
        "icons": icons.toMap(),
        "omega-ruby-alpha-sapphire": omegaRubyAlphaSapphire.toMap(),
    };
}

class GenerationV {
    GenerationVIcons icons;
    Sprites blackWhite;

    GenerationV({
        required this.icons,
        required this.blackWhite,
    });

    factory GenerationV.fromJson(String str) => GenerationV.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        icons: GenerationVIcons.fromMap(json["icons"]),
        blackWhite: Sprites.fromMap(json["black-white"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "black-white": blackWhite.toMap(),
    };
}

class GenerationIx {
    Sprites champions;
    Sprites legendsZa;
    Sprites scarletViolet;

    GenerationIx({
        required this.champions,
        required this.legendsZa,
        required this.scarletViolet,
    });

    factory GenerationIx.fromJson(String str) => GenerationIx.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIx.fromMap(Map<String, dynamic> json) => GenerationIx(
        champions: Sprites.fromMap(json["champions"]),
        legendsZa: Sprites.fromMap(json["legends-za"]),
        scarletViolet: Sprites.fromMap(json["scarlet-violet"]),
    );

    Map<String, dynamic> toMap() => {
        "champions": champions.toMap(),
        "legends-za": legendsZa.toMap(),
        "scarlet-violet": scarletViolet.toMap(),
    };
}

class GenerationIv {
    AnimatedClass icons;
    Sprites platinum;
    Sprites diamondPearl;
    Sprites heartgoldSoulsilver;

    GenerationIv({
        required this.icons,
        required this.platinum,
        required this.diamondPearl,
        required this.heartgoldSoulsilver,
    });

    factory GenerationIv.fromJson(String str) => GenerationIv.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        icons: AnimatedClass.fromMap(json["icons"]),
        platinum: Sprites.fromMap(json["platinum"]),
        diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "platinum": platinum.toMap(),
        "diamond-pearl": diamondPearl.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver.toMap(),
    };
}

class SpritesVersions {
    FluffyGenerationI generationI;
    GenerationV generationV;
    FluffyGenerationIi generationIi;
    GenerationIv generationIv;
    GenerationIx generationIx;
    GenerationVi generationVi;
    GenerationIii generationIii;
    GenerationVii generationVii;
    GenerationViii generationViii;

    SpritesVersions({
        required this.generationI,
        required this.generationV,
        required this.generationIi,
        required this.generationIv,
        required this.generationIx,
        required this.generationVi,
        required this.generationIii,
        required this.generationVii,
        required this.generationViii,
    });

    factory SpritesVersions.fromJson(String str) => SpritesVersions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpritesVersions.fromMap(Map<String, dynamic> json) => SpritesVersions(
        generationI: FluffyGenerationI.fromMap(json["generation-i"]),
        generationV: GenerationV.fromMap(json["generation-v"]),
        generationIi: FluffyGenerationIi.fromMap(json["generation-ii"]),
        generationIv: GenerationIv.fromMap(json["generation-iv"]),
        generationIx: GenerationIx.fromMap(json["generation-ix"]),
        generationVi: GenerationVi.fromMap(json["generation-vi"]),
        generationIii: GenerationIii.fromMap(json["generation-iii"]),
        generationVii: GenerationVii.fromMap(json["generation-vii"]),
        generationViii: GenerationViii.fromMap(json["generation-viii"]),
    );

    Map<String, dynamic> toMap() => {
        "generation-i": generationI.toMap(),
        "generation-v": generationV.toMap(),
        "generation-ii": generationIi.toMap(),
        "generation-iv": generationIv.toMap(),
        "generation-ix": generationIx.toMap(),
        "generation-vi": generationVi.toMap(),
        "generation-iii": generationIii.toMap(),
        "generation-vii": generationVii.toMap(),
        "generation-viii": generationViii.toMap(),
    };
}

class Other {
    HomeClass home;
    Sprites showdown;
    DreamWorld dreamWorld;
    OfficialArtwork officialArtwork;

    Other({
        required this.home,
        required this.showdown,
        required this.dreamWorld,
        required this.officialArtwork,
    });

    factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Other.fromMap(Map<String, dynamic> json) => Other(
        home: HomeClass.fromMap(json["home"]),
        showdown: Sprites.fromMap(json["showdown"]),
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
    );

    Map<String, dynamic> toMap() => {
        "home": home.toMap(),
        "showdown": showdown.toMap(),
        "dream_world": dreamWorld.toMap(),
        "official-artwork": officialArtwork.toMap(),
    };
}

class Sprites {
    Other? other;
    SpritesVersions? versions;
    String backShiny;
    String backFemale;
    String frontShiny;
    String backDefault;
    String frontFemale;
    String frontDefault;
    String backShinyFemale;
    String frontShinyFemale;
    SpritesAnimated? animated;
    HomeClass? icons;

    Sprites({
        this.other,
        this.versions,
        required this.backShiny,
        required this.backFemale,
        required this.frontShiny,
        required this.backDefault,
        required this.frontFemale,
        required this.frontDefault,
        required this.backShinyFemale,
        required this.frontShinyFemale,
        this.animated,
        this.icons,
    });

    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null ? null : SpritesVersions.fromMap(json["versions"]),
        backShiny: json["back_shiny"],
        backFemale: json["back_female"],
        frontShiny: json["front_shiny"],
        backDefault: json["back_default"],
        frontFemale: json["front_female"],
        frontDefault: json["front_default"],
        backShinyFemale: json["back_shiny_female"],
        frontShinyFemale: json["front_shiny_female"],
        animated: json["animated"] == null ? null : SpritesAnimated.fromMap(json["animated"]),
        icons: json["icons"] == null ? null : HomeClass.fromMap(json["icons"]),
    );

    Map<String, dynamic> toMap() => {
        "other": other?.toMap(),
        "versions": versions?.toMap(),
        "back_shiny": backShiny,
        "back_female": backFemale,
        "front_shiny": frontShiny,
        "back_default": backDefault,
        "front_female": frontFemale,
        "front_default": frontDefault,
        "back_shiny_female": backShinyFemale,
        "front_shiny_female": frontShinyFemale,
        "animated": animated?.toMap(),
        "icons": icons?.toMap(),
    };
}

class DreamWorld {
    String? frontFemale;
    String frontDefault;

    DreamWorld({
        required this.frontFemale,
        required this.frontDefault,
    });

    factory DreamWorld.fromJson(String str) => DreamWorld.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontFemale: json["front_female"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "front_female": frontFemale,
        "front_default": frontDefault,
    };
}

class GenerationVIcons {
    AnimatedClass animated;
    String frontDefault;

    GenerationVIcons({
        required this.animated,
        required this.frontDefault,
    });

    factory GenerationVIcons.fromJson(String str) => GenerationVIcons.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationVIcons.fromMap(Map<String, dynamic> json) => GenerationVIcons(
        animated: AnimatedClass.fromMap(json["animated"]),
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "animated": animated.toMap(),
        "front_default": frontDefault,
    };
}

class AnimatedClass {
    String? frontDefault;

    AnimatedClass({
        required this.frontDefault,
    });

    factory AnimatedClass.fromJson(String str) => AnimatedClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AnimatedClass.fromMap(Map<String, dynamic> json) => AnimatedClass(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
    };
}

class FluffyGenerationI {
    RedBlue yellow;
    RedBlue redBlue;
    RedGreenJapan redGreenJapan;

    FluffyGenerationI({
        required this.yellow,
        required this.redBlue,
        required this.redGreenJapan,
    });

    factory FluffyGenerationI.fromJson(String str) => FluffyGenerationI.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FluffyGenerationI.fromMap(Map<String, dynamic> json) => FluffyGenerationI(
        yellow: RedBlue.fromMap(json["yellow"]),
        redBlue: RedBlue.fromMap(json["red-blue"]),
        redGreenJapan: RedGreenJapan.fromMap(json["red-green-japan"]),
    );

    Map<String, dynamic> toMap() => {
        "yellow": yellow.toMap(),
        "red-blue": redBlue.toMap(),
        "red-green-japan": redGreenJapan.toMap(),
    };
}

class RedBlue {
    String backGray;
    String frontGray;
    String backDefault;
    String frontDefault;
    String backTransparent;
    String frontTransparent;
    String backTransparentGray;
    String frontTransparentGray;
    String? backGbc;
    String? frontGbc;

    RedBlue({
        required this.backGray,
        required this.frontGray,
        required this.backDefault,
        required this.frontDefault,
        required this.backTransparent,
        required this.frontTransparent,
        required this.backTransparentGray,
        required this.frontTransparentGray,
        this.backGbc,
        this.frontGbc,
    });

    factory RedBlue.fromJson(String str) => RedBlue.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backGray: json["back_gray"],
        frontGray: json["front_gray"],
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
        backTransparent: json["back_transparent"],
        frontTransparent: json["front_transparent"],
        backTransparentGray: json["back_transparent_gray"],
        frontTransparentGray: json["front_transparent_gray"],
        backGbc: json["back_gbc"],
        frontGbc: json["front_gbc"],
    );

    Map<String, dynamic> toMap() => {
        "back_gray": backGray,
        "front_gray": frontGray,
        "back_default": backDefault,
        "front_default": frontDefault,
        "back_transparent": backTransparent,
        "front_transparent": frontTransparent,
        "back_transparent_gray": backTransparentGray,
        "front_transparent_gray": frontTransparentGray,
        "back_gbc": backGbc,
        "front_gbc": frontGbc,
    };
}

class RedGreenJapan {
    String backGray;
    String frontGray;
    String backDefault;
    String frontDefault;

    RedGreenJapan({
        required this.backGray,
        required this.frontGray,
        required this.backDefault,
        required this.frontDefault,
    });

    factory RedGreenJapan.fromJson(String str) => RedGreenJapan.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RedGreenJapan.fromMap(Map<String, dynamic> json) => RedGreenJapan(
        backGray: json["back_gray"],
        frontGray: json["front_gray"],
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "back_gray": backGray,
        "front_gray": frontGray,
        "back_default": backDefault,
        "front_default": frontDefault,
    };
}

class FluffyGenerationIi {
    Crystal gold;
    Crystal silver;
    Crystal crystal;

    FluffyGenerationIi({
        required this.gold,
        required this.silver,
        required this.crystal,
    });

    factory FluffyGenerationIi.fromJson(String str) => FluffyGenerationIi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FluffyGenerationIi.fromMap(Map<String, dynamic> json) => FluffyGenerationIi(
        gold: Crystal.fromMap(json["gold"]),
        silver: Crystal.fromMap(json["silver"]),
        crystal: Crystal.fromMap(json["crystal"]),
    );

    Map<String, dynamic> toMap() => {
        "gold": gold.toMap(),
        "silver": silver.toMap(),
        "crystal": crystal.toMap(),
    };
}

class Crystal {
    CrystalAnimated? animated;
    String backShiny;
    String frontShiny;
    String backDefault;
    String frontDefault;
    String backTransparent;
    String frontTransparent;
    String backShinyTransparent;
    String frontShinyTransparent;

    Crystal({
        this.animated,
        required this.backShiny,
        required this.frontShiny,
        required this.backDefault,
        required this.frontDefault,
        required this.backTransparent,
        required this.frontTransparent,
        required this.backShinyTransparent,
        required this.frontShinyTransparent,
    });

    factory Crystal.fromJson(String str) => Crystal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        animated: json["animated"] == null ? null : CrystalAnimated.fromMap(json["animated"]),
        backShiny: json["back_shiny"],
        frontShiny: json["front_shiny"],
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
        backTransparent: json["back_transparent"],
        frontTransparent: json["front_transparent"],
        backShinyTransparent: json["back_shiny_transparent"],
        frontShinyTransparent: json["front_shiny_transparent"],
    );

    Map<String, dynamic> toMap() => {
        "animated": animated?.toMap(),
        "back_shiny": backShiny,
        "front_shiny": frontShiny,
        "back_default": backDefault,
        "front_default": frontDefault,
        "back_transparent": backTransparent,
        "front_transparent": frontTransparent,
        "back_shiny_transparent": backShinyTransparent,
        "front_shiny_transparent": frontShinyTransparent,
    };
}

class CrystalAnimated {
    String frontShiny;
    String frontDefault;

    CrystalAnimated({
        required this.frontShiny,
        required this.frontDefault,
    });

    factory CrystalAnimated.fromJson(String str) => CrystalAnimated.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CrystalAnimated.fromMap(Map<String, dynamic> json) => CrystalAnimated(
        frontShiny: json["front_shiny"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "front_shiny": frontShiny,
        "front_default": frontDefault,
    };
}

class GenerationIii {
    AnimatedClass icons;
    Emerald emerald;
    Emerald rubySapphire;
    Emerald fireredLeafgreen;

    GenerationIii({
        required this.icons,
        required this.emerald,
        required this.rubySapphire,
        required this.fireredLeafgreen,
    });

    factory GenerationIii.fromJson(String str) => GenerationIii.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        icons: AnimatedClass.fromMap(json["icons"]),
        emerald: Emerald.fromMap(json["emerald"]),
        rubySapphire: Emerald.fromMap(json["ruby-sapphire"]),
        fireredLeafgreen: Emerald.fromMap(json["firered-leafgreen"]),
    );

    Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "emerald": emerald.toMap(),
        "ruby-sapphire": rubySapphire.toMap(),
        "firered-leafgreen": fireredLeafgreen.toMap(),
    };
}

class Emerald {
    Emerald? animated;
    String backShiny;
    String frontShiny;
    String backDefault;
    String frontDefault;

    Emerald({
        this.animated,
        required this.backShiny,
        required this.frontShiny,
        required this.backDefault,
        required this.frontDefault,
    });

    factory Emerald.fromJson(String str) => Emerald.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
        animated: json["animated"] == null ? null : Emerald.fromMap(json["animated"]),
        backShiny: json["back_shiny"],
        frontShiny: json["front_shiny"],
        backDefault: json["back_default"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "animated": animated?.toMap(),
        "back_shiny": backShiny,
        "front_shiny": frontShiny,
        "back_default": backDefault,
        "front_default": frontDefault,
    };
}

class HomeClass {
    String? frontShiny;
    String frontDefault;
    String? frontFemale;
    String? frontShinyFemale;

    HomeClass({
        this.frontShiny,
        required this.frontDefault,
        this.frontFemale,
        this.frontShinyFemale,
    });

    factory HomeClass.fromJson(String str) => HomeClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HomeClass.fromMap(Map<String, dynamic> json) => HomeClass(
        frontShiny: json["front_shiny"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_shiny": frontShiny,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny_female": frontShinyFemale,
    };
}

class OfficialArtwork {
    OfficialArtworkVersions versions;
    String frontShiny;
    String frontDefault;

    OfficialArtwork({
        required this.versions,
        required this.frontShiny,
        required this.frontDefault,
    });

    factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        versions: OfficialArtworkVersions.fromMap(json["versions"]),
        frontShiny: json["front_shiny"],
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toMap() => {
        "versions": versions.toMap(),
        "front_shiny": frontShiny,
        "front_default": frontDefault,
    };
}

class OfficialArtworkVersions {
    PurpleGenerationI generationI;
    PurpleGenerationIi generationIi;

    OfficialArtworkVersions({
        required this.generationI,
        required this.generationIi,
    });

    factory OfficialArtworkVersions.fromJson(String str) => OfficialArtworkVersions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OfficialArtworkVersions.fromMap(Map<String, dynamic> json) => OfficialArtworkVersions(
        generationI: PurpleGenerationI.fromMap(json["generation-i"]),
        generationIi: PurpleGenerationIi.fromMap(json["generation-ii"]),
    );

    Map<String, dynamic> toMap() => {
        "generation-i": generationI.toMap(),
        "generation-ii": generationIi.toMap(),
    };
}

class PurpleGenerationI {
    AnimatedClass redAndBlue;
    AnimatedClass redAndGreen;

    PurpleGenerationI({
        required this.redAndBlue,
        required this.redAndGreen,
    });

    factory PurpleGenerationI.fromJson(String str) => PurpleGenerationI.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PurpleGenerationI.fromMap(Map<String, dynamic> json) => PurpleGenerationI(
        redAndBlue: AnimatedClass.fromMap(json["red-and-blue"]),
        redAndGreen: AnimatedClass.fromMap(json["red-and-green"]),
    );

    Map<String, dynamic> toMap() => {
        "red-and-blue": redAndBlue.toMap(),
        "red-and-green": redAndGreen.toMap(),
    };
}

class PurpleGenerationIi {
    AnimatedClass goldAndSilver;

    PurpleGenerationIi({
        required this.goldAndSilver,
    });

    factory PurpleGenerationIi.fromJson(String str) => PurpleGenerationIi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PurpleGenerationIi.fromMap(Map<String, dynamic> json) => PurpleGenerationIi(
        goldAndSilver: AnimatedClass.fromMap(json["gold-and-silver"]),
    );

    Map<String, dynamic> toMap() => {
        "gold-and-silver": goldAndSilver.toMap(),
    };
}

class SpritesAnimated {
    String frontShiny;
    String frontFemale;
    String frontDefault;
    String frontShinyFemale;
    String? backShiny;
    String? backFemale;
    String? backDefault;
    String? backShinyFemale;

    SpritesAnimated({
        required this.frontShiny,
        required this.frontFemale,
        required this.frontDefault,
        required this.frontShinyFemale,
        this.backShiny,
        this.backFemale,
        this.backDefault,
        this.backShinyFemale,
    });

    factory SpritesAnimated.fromJson(String str) => SpritesAnimated.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpritesAnimated.fromMap(Map<String, dynamic> json) => SpritesAnimated(
        frontShiny: json["front_shiny"],
        frontFemale: json["front_female"],
        frontDefault: json["front_default"],
        frontShinyFemale: json["front_shiny_female"],
        backShiny: json["back_shiny"],
        backFemale: json["back_female"],
        backDefault: json["back_default"],
        backShinyFemale: json["back_shiny_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_shiny": frontShiny,
        "front_female": frontFemale,
        "front_default": frontDefault,
        "front_shiny_female": frontShinyFemale,
        "back_shiny": backShiny,
        "back_female": backFemale,
        "back_default": backDefault,
        "back_shiny_female": backShinyFemale,
    };
}

class Type {
    int slot;
    Species type;

    Type({
        required this.slot,
        required this.type,
    });

    factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
    };
}
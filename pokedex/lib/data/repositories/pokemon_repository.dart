import '../source/github/github_datasource.dart';
import '../source/local/local_datasource.dart';
import '../source/mappers/github_to_local_mapper.dart';
import '../source/mappers/local_to_entity_mapper.dart';
import '../../domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({int limit, int page});

  Future<Pokemon> getPokemon(String number);
}

class PokemonDefaultRepository extends PokemonRepository {
  PokemonDefaultRepository({required this.githubDataSource, required this.localDataSource});

  final GithubDataSource githubDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<List<Pokemon>> getPokemons({int limit, int page}) async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final pokemonGithubModels = await githubDataSource.getPokemons();
      final pokemonHiveModels = pokemonGithubModels.map((e) => e.toHiveModel());

      await localDataSource.savePokemons(pokemonHiveModels);
    }

    final pokemonHiveModels = await localDataSource.getPokemons(
      page: page,
      limit: limit,
    );
    final pokemonEntities = pokemonHiveModels
        .where((element) => element != null)
        .map((e) => e.toEntity())
        .toList();

    return pokemonEntities;
  }

  @override
  Future<Pokemon> getPokemon(String number) async {
    final pokemonModel = await localDataSource.getPokemon(number);

    // get all evolutions
    final evolutions = await localDataSource.getEvolutions(pokemonModel);

    final pokemon = pokemonModel.toEntity(evolutions: evolutions);

    return pokemon;
  }
}

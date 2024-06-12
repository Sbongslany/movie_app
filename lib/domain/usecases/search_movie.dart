import 'package:dartz/dartz.dart';

import '../../core/error/server_failure.dart';
import '../entities/Movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovies{
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
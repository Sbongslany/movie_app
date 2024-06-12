import 'package:dartz/dartz.dart';

import '../../core/error/server_failure.dart';
import '../entities/Movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getPopularMovies();
  }
}
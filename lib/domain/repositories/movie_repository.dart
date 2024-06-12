import 'package:dartz/dartz.dart';

import '../../core/error/server_failure.dart';
import '../entities/Movie.dart';

abstract class MovieRepository{
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> getPopularMovies();
}
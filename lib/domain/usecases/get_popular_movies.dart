import '../entities/Movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>>call()async{
    return await repository.getPopularMovies();
  }

}
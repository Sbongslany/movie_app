import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecases/search_movie.dart';
import 'package:movie_app/domain/entities/Movie.dart';
import 'get_popular_movies_test.mocks.dart';

void main(){

  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(()  {
  mockMovieRepository =  MockMovieRepository();
  usecase = SearchMovies(mockMovieRepository);
  });

  final tQuery = 'Inception';

  final tMoviesList = [
    Movie(id: 1, title: 'Test Movie 1', overview: 'Disc 1', posterPath: '/image1'),
    Movie(id: 2, title: 'Test Movie 2', overview: 'Disc 3', posterPath: '/image2'),
    Movie(id: 3, title: 'Test Movie 3', overview: 'Disc 3', posterPath: '/image3')

  ];

  test('should get movies from the query fro the repository', () async {

    //arrange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_) async => Right(tMoviesList));
    //act
    final result = await usecase(tQuery);

    //assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);

  });

}
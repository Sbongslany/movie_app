import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/Movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late GetPopularMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMovies(mockMovieRepository);
  });

  final tMovieList = [
    Movie(id: 1, title: 'Test Movie 1', overview: 'Disc 1', posterPath: '/image1'),
    Movie(id: 2, title: 'Test Movie 2', overview: 'Disc 3', posterPath: '/image2'),
    Movie(id: 3, title: 'Test Movie 3', overview: 'Disc 3', posterPath: '/image3')

  ];

  test('should get popular movies from the repository', () async {
    //arrange
    when(mockMovieRepository.getPopularMovies())
        .thenAnswer((_) async => tMovieList);
    //act
    final result = await usecase();

    //assert
    expect(result, tMovieList);
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/server_exception.dart';
import 'package:movie_app/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/data/datasource/remote/movie_remote_data_impl.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])

void main(){
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;


  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });
  const tQuery = 'Avengers';

  const tUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=a2d41dc44929e67f301dcb8ed9a456fd';
  const pUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=a2d41dc44929e67f301dcb8ed9a456fd';
  const sUrl = 'https://api.themoviedb.org/3/search/movie?query=$tQuery&api_key=feefd9dfdbae7ed0a59490812ba90ad8';

  const String sampleApiResponse = '''...''';

  test('should perform a GET request on a url to get trending movies', ()async {
    //arrange
    when(mockHttpClient.get(Uri.parse(tUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    //act
    await dataSource.getTrendingMovies();

    //asserts
    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  //Popular
  test('should perform a GET request on a url to get popular movies', ()async {
    //arrange
    when(mockHttpClient.get(Uri.parse(pUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    //act
    await dataSource.getPopularMovies();

    //asserts
    verify(mockHttpClient.get(Uri.parse(pUrl)));
  });

  ///Search
    test('should perfom a GET request on a url to get search movies', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(sUrl))).
      thenAnswer((_) async => http.Response(sampleApiResponse, 200));

      // act
      await dataSource.searchMovies(tQuery);

      // assert
      verify(mockHttpClient.get(Uri.parse(sUrl)));
    });

  test('should throw server exception when the code is 404', ()async {
    //arrange
    when(mockHttpClient.get(any)).
    thenAnswer((_) async => http.Response('Our Api went wrong', 404));

    //act
    final call = dataSource.getTrendingMovies;

    //asserts
    expect(() => call(), throwsA(isA<ServerException>()));
  });


}
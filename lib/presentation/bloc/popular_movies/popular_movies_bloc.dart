import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_state.dart';


class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(PopularMoviesInitial());

  @override
  Stream<PopularMoviesState> mapEventToState(
    PopularMoviesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

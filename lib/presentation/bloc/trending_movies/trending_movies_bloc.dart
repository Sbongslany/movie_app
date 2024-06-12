import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import '../../../domain/entities/Movie.dart';

part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesBloc() : super(TrendingMoviesInitial());

  @override
  Stream<TrendingMoviesState> mapEventToState(
    TrendingMoviesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

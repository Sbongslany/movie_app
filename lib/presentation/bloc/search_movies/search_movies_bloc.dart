import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/Movie.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  SearchMoviesBloc() : super(SearchMoviesInitial());

  @override
  Stream<SearchMoviesState> mapEventToState(
    SearchMoviesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

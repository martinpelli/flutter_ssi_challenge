import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ssi_challenge/apis/swapi.dart';
import 'package:flutter_ssi_challenge/models/people_response.dart';
import 'package:meta/meta.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  late final Swapi swapi;

  PeopleBloc() : super(const LoadingState()) {
    swapi = Swapi();

    on<GetPeopleEvent>(_getPeople);

    add(GetPeopleEvent());
  }

  FutureOr<void> _getPeople(GetPeopleEvent event, Emitter<PeopleState> emit) async {
    emit(const LoadingState());

    PeopleResponse people = await swapi.getPeople(nextOrPreviousPeopleUrl: event.nextOrPreviousPeopleUrl);

    emit(PeopleFetchedState(people));
  }
}

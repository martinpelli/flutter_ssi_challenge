import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ssi_challenge/people/widgets/character_card.dart';

import '../bloc/people_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      buildWhen: (_, current) => current is PeopleFetchedState || current is LoadingState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 70),
          child: ListView(shrinkWrap: true, children: [
            if (state is LoadingState)
              const _LoadingWidget()
            else
              for (final character in state.people!.results) CharacterCard(character: character)
          ]),
        );
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    ));
  }
}

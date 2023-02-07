import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/people_bloc.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;

  const HomeLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Container(decoration: _buildBoxDecoration(), child: child),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        gradient: RadialGradient(colors: [Color.fromARGB(255, 18, 33, 63), Color.fromARGB(255, 9, 30, 73)], radius: 0.8, stops: [0.05, 0.95]));
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      buildWhen: (_, current) => current is PeopleFetchedState || current is LoadingState,
      builder: (context, state) {
        final PeopleBloc peopleBloc = BlocProvider.of<PeopleBloc>(context);

        return AppBar(
            leading: _ArrowButton(
                iconData: Icons.arrow_back,
                onPressed: () => peopleBloc.add(GetPeopleEvent(nextOrPreviousPeopleUrl: state.people!.previous)),
                isButtonBlocked: state.people == null || state.people!.previous == null),
            actions: [
              _ArrowButton(
                  iconData: Icons.arrow_forward,
                  onPressed: () => peopleBloc.add(GetPeopleEvent(nextOrPreviousPeopleUrl: state.people!.next)),
                  isButtonBlocked: state.people == null || state.people!.next == null),
            ],
            title: const Text("Star Wars Characters", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 18, 33, 63));
      },
    );
  }

  @override
  Size get preferredSize => const Size(0, 60);
}

class _ArrowButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;
  final bool isButtonBlocked;

  const _ArrowButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.isButtonBlocked,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: isButtonBlocked ? Colors.white.withOpacity(0.5) : Colors.white,
      ),
      onPressed: isButtonBlocked ? null : onPressed,
    );
  }
}

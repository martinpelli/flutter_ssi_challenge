import 'package:flutter/material.dart';

import '../../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            leading: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                )),
            title: Text(
              character.name,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
            subtitle: Text(
              character.gender,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

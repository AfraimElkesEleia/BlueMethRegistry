import 'package:flutter/material.dart';

import '../../data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  final RegExp regExp = RegExp(r'(\d+)$');

  CharacterDetailsScreen({super.key, required this.character});

  Widget _appBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name, textAlign: TextAlign.start),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.imageUrl!, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.fade,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          _appBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _characterInfo("status : ", character.status),
                    _buildDivider(315),
                    _characterInfo("species : ", character.species),
                    _buildDivider(310),
                    _characterInfo("gender : ", character.gender),
                    _buildDivider(310),
                    _characterInfo(
                      "episodes : ",
                      character.episodes
                          .map((x) {
                            return regExp.firstMatch(x)!.group(1)!;
                          })
                          .join('/'),
                    ),
                    _buildDivider(290),
                    _characterInfo("city : ", character.cityName),
                    _buildDivider(330),
                    SizedBox(height: 800, width: double.infinity),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

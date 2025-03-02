import 'package:blue_meth_registery/core/data/models/character.dart';
import 'package:blue_meth_registery/core/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/characters_cubit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Character> allCharacters = [];
  List<Character> searchedCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.yellow,
      decoration: InputDecoration(
        hintText: "Find a character !!",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextStyle(fontSize: 10, color: Colors.black),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedCharacters =
        allCharacters
            .where(
              (character) =>
                  character.name.toLowerCase().startsWith(searchedCharacter.toLowerCase()),
            )
            .toList();
    setState(() {});
  }
//***********************************************************//
  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Colors.grey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: Colors.black45, weight: 500),
        ),
      ];
    }
  }

  void _startSearch() {
    //Here I am acting like i made navigation
    ModalRoute.of(
      context,
    )?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder:
            (context, inner) => [
              SliverAppBar(
                actions: _buildAppBarActions(),
                floating: true,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title:
                    _isSearching
                        ? _buildSearchField()
                        : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Breaking",
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' Bad',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
              ),
            ],
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharacterLoaded) {
              if (_searchTextController.text.isEmpty) {
                allCharacters = state.characters!;
              } else {
                allCharacters = searchedCharacters;
              }
              return CharactersScreen(allCharacters: allCharacters);
            } else if (state is Error) {
              return Center(child: Text(state.error));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

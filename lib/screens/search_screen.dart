import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  void _onSearchChanged() {
    setState(() {
      _searchResults = _getSearchResults(_searchController.text);
    });
  }

  List<String> _getSearchResults(String query) {
    // Dummy search results
    final allResults = [
      'Result 1',
      'Result 2',
      'Result 3',
      'Result 4',
      'Result 5',
    ];
    return allResults
        .where((result) => result.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 67, 68, 68), // Light tone
              Color.fromARGB(255, 41, 43, 46), // Dark tone
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Color(0xFFDDDDDD)),
                  prefixIcon: Icon(Icons.search, color: Color(0xFFDDDDDD)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 67, 68, 68),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Color(0xFFDDDDDD)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _searchResults[index],
                      style: const TextStyle(
                        color: Color(0xFFDDDDDD),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

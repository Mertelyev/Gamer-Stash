import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<GameSearchResult> _searchResults = [];

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _searchResults = _getAllGames(); // Tüm oyunları göster
      } else {
        _searchResults = _getSearchResults(_searchController.text);
      }
    });
  }

  List<GameSearchResult> _getAllGames() {
    // Tüm oyunların listesi
    return [
      GameSearchResult(
        title: 'Red Dead Redemption 2',
        platform: 'Steam',
        rating: 4.9,
      ),
      GameSearchResult(
        title: 'God of War',
        platform: 'PlayStation',
        rating: 4.8,
      ),
      GameSearchResult(
        title: 'Fortnite',
        platform: 'Epic Games',
        rating: 4.2,
      ),
      GameSearchResult(
        title: 'Cyberpunk 2077',
        platform: 'Steam',
        rating: 4.0,
      ),
      GameSearchResult(
        title: 'The Last of Us Part II',
        platform: 'PlayStation',
        rating: 4.7,
      ),
      // Daha fazla oyun eklenebilir
    ];
  }

  List<GameSearchResult> _getSearchResults(String query) {
    return _getAllGames()
        .where((game) => game.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    // Başlangıçta tüm oyunları göster
    _searchResults = _getAllGames();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search games...',
              hintStyle: TextStyle(
                  color: isDark ? Colors.grey[400] : Colors.grey[600]),
              prefixIcon: Icon(CupertinoIcons.search,
                  color: isDark ? Colors.white : Colors.grey[800]),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(CupertinoIcons.clear,
                          color: isDark ? Colors.white : Colors.grey[800]),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchResults = _getAllGames();
                        });
                      },
                    )
                  : null,
              filled: true,
              fillColor: isDark ? Colors.black26 : Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(
              color: isDark ? Colors.white : Colors.grey[800],
              fontSize: 16,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Expanded(
          child: _searchResults.isEmpty
              ? Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final game = _searchResults[index];
                    return _buildGameListItem(game);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildGameListItem(GameSearchResult game) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isDark ? Colors.black26 : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        title: Text(
          game.title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        subtitle: Text(
          game.platform,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontFamily: 'Montserrat',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              game.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
        onTap: () {
          // Oyun detay sayfasına yönlendirme
        },
      ),
    );
  }
}

class GameSearchResult {
  final String title;
  final String platform;
  final double rating;

  GameSearchResult({
    required this.title,
    required this.platform,
    required this.rating,
  });
}

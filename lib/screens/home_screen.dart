import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../core/themes.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const SearchScreen(),
    const ProfileScreen(
      username: 'YourUsername',
      email: 'your.email@example.com',
      profileImagePath: 'assets/images/profile_picture.png',
    ),
    const SettingsScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Search',
    'Profile',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[700] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            _titles[_selectedIndex],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: isDark ? const Color(0xFFDDDDDD) : Colors.grey[800],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor:
            isDark ? const Color.fromARGB(255, 41, 43, 46) : Colors.grey[50],
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        const AssetImage('assets/images/profile_picture.png'),
                    backgroundColor:
                        isDark ? Colors.grey[700] : Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'YourUsername',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: isDark ? Colors.white : Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'your.email@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: isDark ? Colors.white : Colors.grey[800],
                ),
              ),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.search,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
              title: Text(
                'Search',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: isDark ? Colors.white : Colors.grey[800],
                ),
              ),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: isDark ? Colors.white : Colors.grey[800],
                ),
              ),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: isDark ? Colors.white : Colors.grey[800],
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: isDark ? Colors.white : Colors.grey[800],
                ),
              ),
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: themeProvider.backgroundDecoration,
        child: _screens[_selectedIndex], // secilen ekrani getir
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              isDark ? const Color.fromARGB(255, 41, 43, 46) : Colors.grey[50],
        ),
        child: BottomNavigationBar(
          selectedItemColor: isDark ? Colors.white : Colors.grey[800],
          unselectedItemColor:
              isDark ? const Color(0xFFDDDDDD) : Colors.grey[600],
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatisticItem(
                    icon: CupertinoIcons.game_controller_solid,
                    value: '142',
                    label: 'Total Games',
                  ),
                  StatisticItem(
                    icon: CupertinoIcons.star_fill,
                    value: '1,337',
                    label: 'Achievements',
                  ),
                  StatisticItem(
                    icon: CupertinoIcons.time,
                    value: '892h',
                    label: 'Playtime',
                  ),
                ],
              ),
            ),
            const PlatformCard(
              platformName: 'Steam',
              logoPath: 'assets/images/Steam_Logo.webp',
              gamesCount: 36,
              achievementsCount: 125,
              playtime: '234h',
            ),
            const PlatformCard(
              platformName: 'Epic Games',
              logoPath: 'assets/images/Epic_Games_Logo.webp',
              gamesCount: 52,
              achievementsCount: 355,
              playtime: '189h',
            ),
            const PlatformCard(
              platformName: 'PlayStation',
              logoPath: 'assets/images/PSN_Logo.webp',
              gamesCount: 11,
              achievementsCount: 52,
              playtime: '469h',
            ),
          ],
        ),
      ),
    );
  }
}

// Yeni StatisticItem widget'ı
class StatisticItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatisticItem({
    required this.icon,
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isDark ? Colors.white : Colors.grey[800], size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.grey[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontSize: 12,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}

class PlatformCard extends StatelessWidget {
  final String platformName;
  final String logoPath;
  final int gamesCount;
  final int achievementsCount;
  final String playtime;

  const PlatformCard({
    required this.platformName,
    required this.logoPath,
    required this.gamesCount,
    required this.achievementsCount,
    required this.playtime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Platform detay sayfasına yönlendirme
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12.0),
              border: !isDark ? Border.all(color: Colors.grey[300]!) : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Image.asset(
                        logoPath,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      platformName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.grey[800],
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStat(context, CupertinoIcons.game_controller_solid,
                        '$gamesCount', 'Games'),
                    _buildStat(context, CupertinoIcons.star_fill,
                        '$achievementsCount', 'Achievements'),
                    _buildStat(
                        context, CupertinoIcons.time, playtime, 'Playtime'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(
      BuildContext context, IconData icon, String value, String label) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Column(
      children: [
        Icon(icon, color: isDark ? Colors.white70 : Colors.grey[800], size: 20),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.grey[800],
            fontFamily: 'Montserrat',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey[400] : Colors.grey[600],
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }
}

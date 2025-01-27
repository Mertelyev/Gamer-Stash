import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

  // ekranlarin listesi ve gozukmesi icin
  final List<Widget> _screens = [
    const HomeContent(), // homecontent widget cagir
    const SearchScreen(), // searchscreen widget cagir
    ProfileScreen(
      username: 'YourUsername', // ornek kullanici adi
      email: 'your.email@example.com', // ornek email
      profileImagePath: 'assets/images/profile_picture.png',
    ), // profilescreen
    const SettingsScreen(), // settings screen
  ];

  // baslik listesi
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
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            _titles[_selectedIndex],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Color(0xFFDDDDDD),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 67, 68, 68),
        iconTheme:
            const IconThemeData(color: Color(0xFFDDDDDD)), // hamburgerin rengi
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 41, 43, 46),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 67, 68, 68),
                    Color.fromARGB(255, 41, 43, 46),
                  ],
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home, color: Colors.white),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Color(0xFFDDDDDD),
                ),
              ),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search, color: Colors.white),
              title: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Color(0xFFDDDDDD),
                ),
              ),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Color(0xFFDDDDDD),
                ),
              ),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                  color: Color(0xFFDDDDDD),
                ),
              ),
              onTap: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 67, 68, 68),
              Color.fromARGB(255, 41, 43, 46),
            ],
          ),
        ),
        child: _screens[_selectedIndex], // secilen ekrani getir
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 41, 43, 46),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFFDDDDDD),
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
              _selectedIndex = index; // yeni ekran secildiginde index updatei
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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toplam İstatistikler Kartı
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
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
            // Platform Kartları
            const PlatformCard(
              platformName: 'Steam',
              logoPath: 'assets/images/Steam_Logo.webp',
              gamesCount: 36,
              achievementsCount: 125,
            ),
            PlatformCard(
              platformName: 'Epic Games',
              logoPath: 'assets/images/Epic_Games_Logo.webp',
              gamesCount: 52,
              achievementsCount: 355,
            ),
            PlatformCard(
              platformName: 'PlayStation',
              logoPath: 'assets/images/PSN_Logo.webp',
              gamesCount: 11,
              achievementsCount: 52,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
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

  const PlatformCard({
    required this.platformName,
    required this.logoPath,
    required this.gamesCount,
    required this.achievementsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(logoPath, width: 24, height: 24),
              const SizedBox(width: 8.0),
              Text(
                platformName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black),
          const SizedBox(height: 8.0),
          Text(
            'Games from $platformName: $gamesCount',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: Color(0xFF212121),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            'Achievements from $platformName: $achievementsCount',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: Color(0xFF212121),
            ),
          ),
        ],
      ),
    );
  }
}

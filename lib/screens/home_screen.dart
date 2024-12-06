import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'profile_screen.dart'; // Import profile screen
import 'search_screen.dart'; // Import search screen
import 'settings_screen.dart'; // Import settings screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Determine which screen to show in the bottom navigation bar
  final List<Widget> _screens = [
    const HomeContent(), // Updated to use HomeContent
    const SearchScreen(), // Call SearchScreen widget here
    const ProfileScreen(), // Call ProfileScreen widget here
    const SettingsScreen(), // Call SettingsScreen widget here
  ];

  // Determine the title based on the selected index
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
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat', // Montserrat font
            color: Color(0xFFDDDDDD), // Very light gray color
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 67, 68, 68), // Lighter tone
        iconTheme: const IconThemeData(
            color: Color(0xFFDDDDDD)), // Set hamburger icon color
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 41, 43, 46), // Dark tone
        child: Column(
          children: [
            Container(
              height: 200,
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
                      fontFamily: 'Montserrat', // Montserrat font
                      color: Color(0xFFDDDDDD), // Very light gray color
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat', // Montserrat font
                  color: Color(0xFFDDDDDD), // Very light gray color
                ),
              ),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat', // Montserrat font
                  color: Color(0xFFDDDDDD), // Very light gray color
                ),
              ),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat', // Montserrat font
                  color: Color(0xFFDDDDDD), // Very light gray color
                ),
              ),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat', // Montserrat font
                  color: Color(0xFFDDDDDD), // Very light gray color
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
              Color.fromARGB(255, 67, 68, 68), // Light tone
              Color.fromARGB(255, 41, 43, 46), // Dark tone
            ],
          ),
        ),
        child: _screens[_selectedIndex], // Show the selected screen
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 41, 43, 46), // Dark tone
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFFDDDDDD), // Very light gray color
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
              _selectedIndex =
                  index; // Update index when a new screen is selected
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
    return Center(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Make the container height fit its content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[400], // Darker grey color
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Make the container height fit its content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Steam_Logo.webp',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Steam',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat', // Montserrat font
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Games from Steam: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Achievements from Steam: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[400], // Darker grey color
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Make the container height fit its content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Epic_Games_Logo.webp',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Epic Games',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat', // Montserrat font
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Games from Epic Games: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Achievements from Epic Games: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[400], // Darker grey color
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Make the container height fit its content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/PSN_Logo.webp',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'PlayStation',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat', // Montserrat font
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Games from PlayStation: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Achievements from PlayStation: 0',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat', // Montserrat font
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

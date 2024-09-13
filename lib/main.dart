import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  // Method to toggle between light and dark themes
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(toggleTheme: _toggleTheme, themeMode: _themeMode),
    );
   }
}

class HomeScreen extends StatelessWidget {
  final Function toggleTheme;
  final ThemeMode themeMode;

  const HomeScreen({Key? key, required this.toggleTheme, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the container color based on the theme
    Color containerColor = themeMode == ThemeMode.light ? Colors.grey : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: Theme.of(context).scaffoldBackgroundColor, // Animate the background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: containerColor, // Color based on theme
                  shape: BoxShape.circle, // Circular shape
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16.0), // Reasonable margin
                child: const Text(
                  'Mobile App Development Testing',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Font size and color
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => toggleTheme(),
                child: Text(themeMode == ThemeMode.light ? 'Switch to Dark Theme' : 'Switch to Light Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

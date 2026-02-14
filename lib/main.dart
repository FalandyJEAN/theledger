import 'package:flutter/material.dart';
import 'package:the/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Ledger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0; 

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Categories',
          ),
        ],
      ),
    body: ListView(
  padding: const EdgeInsets.all(16),
  children: [
   
    const Text(
      'À la une',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 20), 

    
    ClipRect(
      child: Banner(
        message: "À la une",
        location: BannerLocation.topEnd,
        color: Colors.redAccent,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  'https://th.bing.com/th/id/OIF.WSXDhD5jCwPnvthV79KV4w?w=248&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1',
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Donald Trump a la conquete de la Maison Blanche',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),

    const SizedBox(height: 20), 

    // Articles en liste
    ListTile(
      leading: Image.network(
        'https://th.bing.com/th/id/OIF.WSXDhD5jCwPnvthV79KV4w?w=248&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1',
      ),
      title: const Text('Donald Trump a la conquete de la Maison Blanche'),
      subtitle: const Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc at sollicitudin ...',
      ),
      isThreeLine: true,
      dense: true,
      trailing: const Icon(Icons.arrow_circle_right_outlined),
    ),

    ListTile(
      leading: Image.network(
        'https://th.bing.com/th/id/OIF.WSXDhD5jCwPnvthV79KV4w?w=248&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1',
      ),
      title: const Text('Donald Trump a la conquete de la Maison Blanche'),
      subtitle: const Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula, nunc at sollicitudin ...',
      ),
      isThreeLine: true,
      dense: true,
      trailing: const Icon(Icons.arrow_circle_right_outlined),
    ),
  ],
),

    );
  }
}
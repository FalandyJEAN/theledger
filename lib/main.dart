import 'package:flutter/material.dart';
import 'package:the/splash_screen.dart';
import 'package:the/details_page.dart';
import 'package:the/category.dart';
import 'package:the/favorites.dart';

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

// PAGE D’ACCUEIL

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  String selectedCategory = "Actualites";

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      "The Ledger",
      style: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),

  // 🔹 Drawer
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.deepPurple),
          child: Text(
            "Menu",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.login),
          title: const Text("Connexion"),
          onTap: () {},
        ),

        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text("Favoris"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ),
            );
          },
        ),

        ListTile(
          leading: const Icon(Icons.category),
          title: const Text("Catégories"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryPage(),
              ),
            );
          },
        ),
      ],
    ),
  ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });

          if (index == 1) {
            // Favorites
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesPage()),
            );
          } else if (index == 2) {
            // Categories
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryPage()),
            );
          }
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Categories'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Barre de catégories chatGpt
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip("Actualites", isSelected: selectedCategory == "Actualites"),
                      _buildCategoryChip("Business", isSelected: selectedCategory == "Business"),
                      _buildCategoryChip("Tech", isSelected: selectedCategory == "Tech"),
                      _buildCategoryChip("Education", isSelected: selectedCategory == "Education"),
                      _buildCategoryChip("Politique", isSelected: selectedCategory == "Politique"),
                      _buildCategoryChip("Sport", isSelected: selectedCategory == "Sport"),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20), //fini la

          // 🔹 Grille 2x2 avec 6 articles
         GridView.count( 
          shrinkWrap: true, 
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2, 
          crossAxisSpacing: 10, 
          mainAxisSpacing: 10, 
          children: List.generate(6, (index) { 
          final titles = [ 
            "Économie mondiale", 
            "Nouvelles technologies", 
            "Éducation numérique", 
            "Politique internationale", 
            "Sport et performance", 
            "Actualités locales" ]; 
            final images = [ 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", 
              "https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1", ]; 
              return InkWell( onTap: () { 
                Navigator.push( context, 
                MaterialPageRoute( builder: (context) => DetailsPage( 
                  title: titles[index], 
                  imageUrl: images[index], 
                  content: "Voici le contenu fictif de l'article ${titles[index]}. " 
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " 
                  "Donec vehicula, nunc at sollicitudin facilisis, justo erat " 
                  "mattis lorem, vitae feugiat magna nulla vel velit.", 
                  ), 
                ), 
              ); 
            }, 
            child: Card( 
              elevation: 2, 
              child: Column( 
                children: [ 
                  Expanded(
                     child: Image.network( 
                      images[index], 
                      fit: BoxFit.cover, 
                    ), 
                  ), 
                  Padding( padding: const EdgeInsets.all(8.0), 
                  child: Text( titles[index], 
                  style: const TextStyle( fontWeight: FontWeight.bold, ), 
                ), 
              ), 
            ], 
          ), 
        ), 
      ); 
    }), 
  ),

         
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
                          'https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1'
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Donald Trump a la conquete de la Maison Blanche',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          'https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1'
), 
                      const SizedBox(height: 20),
                      const Text(
                        'Deuxième grosse carte exemple',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Articles en liste
          ListTile(
            leading: Image.network('https://via.placeholder.com/80'),
            title: const Text('Article exemple 1'),
            subtitle: const Text('Lorem ipsum dolor sit amet...'),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
          ListTile(
            leading: Image.network('https://via.placeholder.com/80'),
            title: const Text('Article exemple 2'),
            subtitle: const Text('Lorem ipsum dolor sit amet...'),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
        ],
      ),
    );
  }

  //  CATÉGORIE

// ChatGpt
  Widget _buildCategoryChip(String label, {bool isSelected = false}) { 
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 8), 
      child: ChoiceChip( label: Text(label), 
      selected: isSelected,  
      selectedColor: Colors.blueGrey, 
      backgroundColor: Colors.grey[200], 
      labelStyle: TextStyle( 
        color: isSelected ? Colors.white : Colors.black, 
        fontWeight: FontWeight.w600, ), 
        onSelected: (bool selected) { 
          setState(() { 
            selectedCategory = label; 
            }
          ); 
        }, 
      ), 
    ); 
  }
} //fini la
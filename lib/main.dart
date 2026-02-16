import 'package:flutter/material.dart';
import 'package:the/splash_screen.dart';
import 'package:the/details_page.dart';
import 'package:the/news.dart';
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
                  MaterialPageRoute(builder: (context) => const FavoritesPage()),
                );
              },
            ),
           
            ListTile(
              leading: const Icon(Icons.newspaper),
              title: const Text("News"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsPage()),
                );
              },
            ),
             ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Déconnexion"),
              onTap: () {},
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewsPage()),
            );
          }
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'News'),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 30),

          // 🔹 Grille 2x2 avec 6 articles
       GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  childAspectRatio: 0.75, 
  children: List.generate(8, (index) {
    final titles = [
      "Économie mondiale",
      "Nouvelles technologies",
      "Éducation numérique",
      "Politique internationale",
      "Sport et performance",
      "Actualités locales"
    ];
    final images = [
      "https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?w=400",
      "https://images.unsplash.com/photo-1677442136019-21780ecad995?w=400",
      "https://images.unsplash.com/photo-1501504905252-473c47e087f8?w=400",
      "https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?w=400",
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400",
      "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400",
    ];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: titles[index],
              imageUrl: images[index],
              content: "Men tout sa k pase nan atik ${titles[index]} la...",
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4, 
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 5, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. TIT LA
                    Text(
                      titles[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    
                    
                    Text(
                      "Découvrez les détails importants de ce dossier concernant ${titles[index].toLowerCase()} et ses impacts...",
                      maxLines: 3, 
                      overflow: TextOverflow.ellipsis, 
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        height: 1.3,
                      ),
                    ),
                    
                    const Spacer(),
                    
                  
                    const Text(
                      "Lire l'article >",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }),
),

          const SizedBox(height: 40),

          // 🔹 TITRE : À LA UNE
          const Text(
            "À la une",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsPage(
                    title: 'Donald Trump a la conquete de la Maison Blanche',
                    imageUrl: 'https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1',
                    content: "Donald Trump lance sa campagne pour la Maison Blanche avec des discours marquants...",
                  ),
                ),
              );
            },
            child: ClipRect(
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
                        Image.network('https://th.bing.com/th/id/OIP.NhtN6RQ7rZFUSvGPtV8HUAHaEK?w=283&h=180&c=7&r=0&o=7&cb=defcache2&pid=1.7&rm=3&defcache=1'),
                        const SizedBox(height: 20),
                        const Text(
                          'Donald Trump a la conquete de la Maison Blanche',
                          softWrap: true,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // 🔹 TITRE : ARTICLES QUE TU DEVRAIS LIRE
          const Text(
            "Articles que tu devrais lire",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // 🔹 MODIFICATION : Articles en liste ak done diferan
          _buildListTile(context, 
            "La chute du Bitcoin", 
            "Le marché des cryptomonnaies en alerte rouge ce matin.",
            "https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=200",
            "Le Bitcoin a chuté de 10% en quelques heures, entraînant le reste du marché dans sa course..."
          ),
          _buildListTile(context, 
            "Santé : Le sport est vital", 
            "Découvrez pourquoi 30 min de marche changent tout.",
            "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=200",
            "Les médecins confirment que l'activité physique régulière prévient de nombreuses maladies chroniques..."
          ),
          _buildListTile(context, 
            "Voyage : Top 5 destinations", 
            "Où partir cet été sans se ruiner ?",
            "https://images.unsplash.com/photo-1503220317375-aaad61436b1b?w=200",
            "De la Grèce à la Thaïlande, voici les meilleures destinations pour des vacances inoubliables..."
          ),
        ],
      ),
    );
  }

  // 🔹 DÉTAILS
  Widget _buildListTile(BuildContext context, String title, String subtitle, String imgUrl, String content) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: title,
              imageUrl: imgUrl,
              content: content,
            ),
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imgUrl, width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.arrow_circle_right_outlined),
    );
  }
}
 
import 'package:flutter/material.dart';
import 'package:the/details_page.dart'; 
import 'package:the/main.dart';      
import 'package:the/favorites.dart'; 

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecteur Actu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NewsPage(), 
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int currentPageIndex = 2;

  final List<Map<String, dynamic>> News = const [
    {'id': 1, 'name': 'BBC News', 'icon': Icons.language, 'color': Colors.red, 'articleCount': 12},
    {'id': 2, 'name': 'CNN', 'icon': Icons.live_tv, 'color': Colors.blue, 'articleCount': 8},
    {'id': 4, 'name': 'The Verge', 'icon': Icons.bolt, 'color': Colors.deepPurple, 'articleCount': 5},
    {'id': 5, 'name': 'TechCrunch', 'icon': Icons.memory, 'color': Colors.green, 'articleCount': 9},
    {'id': 6, 'name': 'National Geographic', 'icon': Icons.map, 'color': Colors.amber, 'articleCount': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News d'actualités"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: News.length,
          itemBuilder: (context, index) {
            final source = News[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticlesPage(
                      nomSource: source['name'], 
                      couleurSource: source['color'],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: (source['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: (source['color'] as Color).withOpacity(0.3)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(source['icon'], size: 45, color: source['color']),
                    const SizedBox(height: 8),
                    Text(
                      source['name'], 
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text('${source['articleCount']} articles récents', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'The Ledger'))
            );
          } else if (index == 1) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const FavoritesPage())
            );
          }
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined), 
            selectedIcon: Icon(Icons.home),
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border), 
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites'
          ),
          NavigationDestination(
            icon: Icon(Icons.menu), 
            label: 'News' 
          ),
        ],
      ),
    );
  }
}

class ArticlesPage extends StatelessWidget {
  final String nomSource; 
  final Color couleurSource;

  const ArticlesPage({
    super.key,
    required this.nomSource,
    required this.couleurSource,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> articles = [
      {
        'titre': 'Dernières de $nomSource',
        'desc': 'Le flux en direct des informations importantes venant de la source...',
        'image': 'https://picsum.photos/200/300?random=101',
      },
      {
        'titre': 'Analyse hebdomadaire',
        'desc': 'Un regard approfondi sur les événements marquants de la semaine...',
        'image': 'https://picsum.photos/200/300?random=102',
      },
      {
        'titre': 'Reportage exclusif',
        'desc': 'Une enquête spéciale menée par les journalistes de la rédaction...',
        'image': 'https://picsum.photos/200/300?random=103',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(nomSource),
        backgroundColor: couleurSource.withOpacity(0.2),
        foregroundColor: couleurSource,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, 
          ),
          itemCount: articles.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      title: articles[i]['titre']!,
                      imageUrl: articles[i]['image']!,
                      content: articles[i]['desc']!,
                    ),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        articles[i]['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, error, stack) => Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[i]['titre']!,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              articles[i]['desc']!,
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl; 
  final String content;

  const DetailsPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ajouté aux favoris !")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl, 
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Titre
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Contenu
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

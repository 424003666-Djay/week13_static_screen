// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeFeedScreen(),
    );
  }
}

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        leading: const Icon(Icons.menu),
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: const [
          Icon(Icons.notifications_none),
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // FOLLOWING / FOR YOU Tabs Section
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 3),
                          ),
                        ),
                        child: const Text(
                          'FOLLOWING',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Text(
                          'FOR YOU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // First Post Card (alex) - Updated likes to '25' for Hot Reload
              const PostCard(
                name: 'alex',
                handle: '@alex.v',
                caption:
                    'Just discovered this amazing new product!\nHighly recommend checking it out 🔥',
                likes: '25',
                comments: '8',
                avatarColor: Colors.orangeAccent,
                imagePlaceholderColor: Color(0xFFD7CCC8),
                imageLabel: 'Desk Setup Photo',
              ),

              // Second Post Card (sarah)
              const PostCard(
                name: 'sarah',
                handle: '@sarah.art',
                caption:
                    'Working on some exciting new designs today!\nStay tuned for the reveal 🎨',
                likes: '42',
                comments: '15',
                avatarColor: Colors.purpleAccent,
                imagePlaceholderColor: Color(0xFFCFD8DC),
                imageLabel: 'Artwork Sketch Photo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom StatelessWidget para sa bawat feed post
class PostCard extends StatelessWidget {
  final String name;
  final String handle;
  final String caption;
  final String likes;
  final String comments;
  final Color avatarColor;
  final Color imagePlaceholderColor;
  final String imageLabel;

  const PostCard({
    super.key,
    required this.name,
    required this.handle,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.avatarColor,
    required this.imagePlaceholderColor,
    required this.imageLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Profile Row
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: avatarColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      handle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey[600]),
            ],
          ),

          const SizedBox(height: 12),

          // Post Caption
          Text(
            caption,
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),

          const SizedBox(height: 12),

          // Post Image Container Placeholder
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              color: imagePlaceholderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, size: 40, color: Colors.grey[700]),
                const SizedBox(height: 6),
                Text(
                  imageLabel,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 6),

          // Bottom Action Row (Heart, Comment, Share)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey[700], size: 20),
                  const SizedBox(width: 6),
                  Text(likes, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.grey[700], size: 20),
                  const SizedBox(width: 6),
                  Text(comments, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
              Icon(Icons.ios_share, color: Colors.grey[700], size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
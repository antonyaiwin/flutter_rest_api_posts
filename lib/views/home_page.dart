import 'package:flutter/material.dart';
import 'package:flutter_rest_api_posts/views/post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Posts'),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PostsPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_posts/views/full_post_page.dart';

import '../models/post.dart';

class PostView extends StatelessWidget {
  final Post post;
  final String author;
  const PostView({super.key, required this.post, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              post.body,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'By: $author',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade800),
                )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullPostPage(post: post, author: author),
                        ),
                      );
                    },
                    child: const Text('Read more..'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

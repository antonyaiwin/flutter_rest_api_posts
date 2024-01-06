import 'package:flutter/material.dart';
import 'package:flutter_rest_api_posts/services/remote_service.dart';
import 'package:flutter_rest_api_posts/widgets/comment_widget.dart';

import '../models/comment.dart';
import '../models/post.dart';

class FullPostPage extends StatefulWidget {
  const FullPostPage({super.key, required this.post, required this.author});
  final Post post;
  final String author;
  @override
  State<FullPostPage> createState() => _FullPostPageState();
}

class _FullPostPageState extends State<FullPostPage> {
  List<Comment>? comments;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  Future<void> getComments() async {
    comments = await remoteService.getComments(widget.post.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.post.title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'By: ${widget.author}',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.post.body,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Comments:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: comments!.length,
                        itemBuilder: (context, index) {
                          return CommentWidget(comment: comments![index]);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_posts/services/remote_service.dart';
import 'package:flutter_rest_api_posts/widgets/post_widget.dart';

import '../models/post.dart';
import '../models/user.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post>? posts;
  List<User>? users;
  bool isLoading = true;
  late RemoteService _remoteService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
  }

  void getPosts() async {
    _remoteService = RemoteService();
    posts = await _remoteService.getPosts();
    users = await _remoteService.getUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: posts == null
            ? const Center(
                child: Text('Some error occurred while loading data!'),
              )
            : ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  var author = users!.firstWhere(
                      (element) => element.id == posts![index].userId);
                  return PostView(
                    post: posts![index],
                    author: author.name,
                  );
                },
              ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

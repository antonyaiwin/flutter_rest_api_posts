import 'package:http/http.dart' as http;

import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

class RemoteService {
  http.Client client = http.Client();
  Future<List<Post>?> getPosts() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    }
    return null;
  }

  Future<List<User>?> getUsers() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return usersFromJson(response.body);
    }
    return null;
  }

  Future<List<Comment>?> getComments(int postId) async {
    var uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/comments?postId=$postId');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return commentsFromJson(response.body);
    }
    return null;
  }
}

final remoteService = RemoteService();

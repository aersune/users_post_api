import 'package:http/http.dart' as http;

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

}

// https://jsonplaceholder.typicode.com/posts

class PostsApi {
  static Future getPosts() {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  }
}



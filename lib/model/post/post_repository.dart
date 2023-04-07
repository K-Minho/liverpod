import 'package:http_riverpod_app/model/post/post.dart';

class PostRepository {
  static PostRepository _instance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), () {
      return [
        Post(id: 1, title: "title1"),
        Post(id: 2, title: "title2"),
        Post(id: 3, title: "title3"),
      ];
    });
  }

  Future<Post> save(String title) {
    return Future.delayed(Duration(seconds: 1), () {
      return Post(id: 4, title: "title4");
    });
  }

  Future<Post> update(Post post) {
    return Future.delayed(Duration(seconds: 1), () {
      return post;
    });
  }

  Future<void> delete(int id) {
    return Future.delayed(Duration(seconds: 1), () {
    });
  }
}

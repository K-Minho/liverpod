import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';
import 'package:http_riverpod_app/view/pages/post/home/home_page_view_model.dart';


final postController = Provider<PostController>((ref){
  return PostController(ref);
});

class PostController {
  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> homePagePostDto = await PostRepository().findAll();
    ref.read(postHomePageProvider.notifier).init(homePagePostDto);
  }

  Future<void> addPosts(String title) async {
    Post post = await PostRepository().save(title);
    ref.read(postHomePageProvider.notifier).add(post);
  }

  Future<void> updatePosts(Post post) async {
    Post postPS = await PostRepository().update(post);
    ref.read(postHomePageProvider.notifier).update(postPS);

  }

  Future<void> deletePosts(int id) async {
    await PostRepository().delete(id);
    ref.read(postHomePageProvider.notifier).remove(id);
  }
}
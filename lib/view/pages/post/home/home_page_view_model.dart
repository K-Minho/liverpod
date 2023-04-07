import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// 관리자 (Provider)
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});

// 데이터 (Data)
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}

// 저장소 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts;
    // 새로운 값(레퍼런스)를 넣어줘야 갱신이 됨 ※변경 감지를 통해 인식
    List<Post> newposts = [...posts, post]; // 깊은 복사
    state = PostHomePageModel(posts: newposts);
  }

  void remove(int id) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.where((e) => e.id != id).toList();
    // 참이면 리스트에 추가, 거짓이면 리스트에서 제거
    // where => 검색, 삭제
  }

  void update(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newposts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newposts);
  }
}
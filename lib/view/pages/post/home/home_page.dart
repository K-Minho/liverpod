import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/view/pages/post/home/home_page_view_model.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("reload?");
    PostController pc = ref.read(postController);
    PostHomePageModel? pm = ref.watch(postHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: pm != null ? buildListView(pm.posts) : buildListView([]),
          ),
          ElevatedButton(
            onPressed: () {
              pc.findPosts();
            },
            child: Text("load"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.addPosts("new title");
            },
            child: Text("add"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.updatePosts(Post(id: 2,title: "new title"));
            },
            child: Text("update"),
          ),
          ElevatedButton(
            onPressed: () {
              pc.deletePosts(1);
            },
            child: Text("delete"),
          ),
        ],
      ),
    );
  }

  ListView buildListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) =>
          ListTile(
            leading: Text("${posts[index].id}"),
            title: Text("${posts[index].title}"),
          ),
    );
  }
}

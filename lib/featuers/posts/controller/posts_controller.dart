import 'package:get/get.dart';

import 'package:post_app/core/entity/post_entity.dart';

abstract class PostsController extends GetxController {
  // add post
  Future<void> addPost({required PostsModel post});
  Future<void> updatePost({required PostsModel post});
  Future<void> deletePosts({required int id});
  Future<void> showPosts({required int id});
  Future<void> getPosts();
}

class PostsControllerImpl extends PostsController {
  List<PostsModel> posts = [];
  PostsModel? postDetils;

  @override
  Future<void> addPost({required PostsModel post}) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePosts({required int id}) {
    // TODO: implement deletePosts
    throw UnimplementedError();
  }

  @override
  Future<void> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<void> showPosts({required int id}) {
    // TODO: implement showPosts
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost({required PostsModel post}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}

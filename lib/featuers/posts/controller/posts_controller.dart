import 'package:get/get.dart';

import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/core/error/handle_message.dart';
import 'package:post_app/featuers/posts/repository/posts_repository.dart';

abstract class PostsController extends GetxController {
  // add post
  Future<void> addPost({required PostsModel post});
  Future<void> updatePost({required PostsModel post});
  Future<void> deletePosts({required int id});
  Future<void> showPosts({required int id});
  Future<void> getPosts();
}

class PostsControllerImpl extends PostsController {
  final PostsRepository _repository = PostsRepositoryImpl();

  List<PostsModel> posts = [];
  PostsModel? postDetils;

  @override
  Future<void> addPost({required PostsModel post}) async {
    final request = await _repository.addPosts(post: post);
    request.fold(
      (failure) {
        handeErorr(failure);
      },
      (unit) {
        handelSuccess();
      },
    );
  }

  @override
  Future<void> deletePosts({required int id}) async {
    final request = await _repository.deletePosts(id: id);
    request.fold(
      (failure) {
        handeErorr(failure);
      },
      (unit) {
        handelSuccess();
      },
    );
  }

  @override
  Future<void> getPosts() async {
    final request = await _repository.getPosts();
    request.fold(
      (failure) {
        handeErorr(failure);
      },
      (data) {
        posts = data;
        update();
      },
    );
  }

  @override
  Future<void> showPosts({required int id}) async {
    final request = await _repository.showPost(id: id);
    request.fold(
      (failure) {
        handeErorr(failure);
      },
      (data) {
        postDetils = data;
        update();
      },
    );
  }

  @override
  Future<void> updatePost({required PostsModel post}) async {
    final request = await _repository.updatePosts(post: post);
    request.fold(
      (failure) {
        handeErorr(failure);
      },
      (unit) {
        handelSuccess();
      },
    );
  }
}

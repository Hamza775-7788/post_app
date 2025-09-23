import 'package:dartz/dartz.dart';
import 'package:post_app/core/entity/post_entity.dart';


abstract class PostsLocalDataSource {
  Future<Unit> setPosts({required List<PostsModel> posts});
  Future<List<PostsModel>> getPosts();
}

class PostsLocalDataSourceImpl implements PostsLocalDataSource {


  @override
  Future<List<PostsModel>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> setPosts({required List<PostsModel> posts}) {
    // TODO: implement setPosts
    throw UnimplementedError();
  }
}


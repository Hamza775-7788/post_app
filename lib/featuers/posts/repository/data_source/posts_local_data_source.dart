import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/core/error/exceptions.dart';
import 'package:post_app/main.dart';

abstract class PostsLocalDataSource {
  Future<Unit> setPosts({required List<PostsModel> posts});
  Future<List<PostsModel>> getPosts();
}

const CASHED_POSTS = "CASHED_POSTS";

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  @override
  Future<List<PostsModel>> getPosts() async {
    final String? data = sharedPreferences!.getString(CASHED_POSTS);

    if (data != null) {
      final jsonData = jsonDecode(data);
      final listData = jsonData as List;
      return listData.map<PostsModel>((e) => PostsModel.fromJosn(e)).toList();
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> setPosts({required List<PostsModel> posts}) async {
    final data = posts.map((e) => e.toJosn()).toList();

    try {
      await sharedPreferences!.setString(CASHED_POSTS, jsonEncode(data));
      return unit;
    } catch (e) {
      throw OperationNotCompletedException();
    }
  }
}

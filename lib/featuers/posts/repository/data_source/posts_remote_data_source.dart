import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/core/error/exceptions.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostsModel>> getPosts();
  Future<PostsModel> showPost({required int id});
  Future<Unit> addPosts({required PostsModel post});
  Future<Unit> updatePosts({required PostsModel post});
  Future<Unit> deletePosts({required int id});
}

const String url = "https://jsonplaceholder.typicode.com/posts";

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final GetConnect getConnect = GetConnect();
  @override
  Future<Unit> addPosts({required PostsModel post}) async {
    final body = post.toJosn();

    final request = await getConnect.post(url, jsonEncode(body));
    if (request.statusCode == 201) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePosts({required int id}) async {
    final request = await getConnect.delete("$url/$id");
    if (request.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostsModel>> getPosts() async {
    final request = await getConnect.get(url);
    if (request.statusCode == 200) {
      final jsonData = jsonDecode(request.body);
      final listData = jsonData as List;

      return listData.map<PostsModel>((e) => PostsModel.fromJosn(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostsModel> showPost({required int id}) async {
    final request = await getConnect.get(url);
    if (request.statusCode == 200) {
      final jsonData = jsonDecode(request.body);

      return PostsModel.fromJosn(jsonData);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePosts({required PostsModel post}) async {
    final body = post.toJosn();

    final request = await getConnect.put("$url/${post.id}", jsonEncode(body));
    if (request.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}

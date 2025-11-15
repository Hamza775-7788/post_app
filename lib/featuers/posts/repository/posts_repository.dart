import 'package:dartz/dartz.dart';
import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/core/error/exceptions.dart';
import 'package:post_app/core/error/failure.dart';
import 'package:post_app/core/nerwork/network.dart';
import 'package:post_app/featuers/posts/repository/data_source/posts_local_data_source.dart';
import 'package:post_app/featuers/posts/repository/data_source/posts_remote_data_source.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostsModel>>> getPosts();
  Future<Either<Failure, PostsModel>> showPost({required int id});
  Future<Either<Failure, Unit>> addPosts({required PostsModel post});
  Future<Either<Failure, Unit>> updatePosts({required PostsModel post});
  Future<Either<Failure, Unit>> deletePosts({required int id});
}

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource remoteDataSource = PostsRemoteDataSourceImpl();
  final PostsLocalDataSource localDataSource = PostsLocalDataSourceImpl();

  final NetworkInfo networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, Unit>> addPosts({required PostsModel post}) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.addPosts(post: post);
        return Right(unit);
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePosts({required int id}) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.deletePosts(id: id);
        return Right(unit);
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostsModel>>> getPosts() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.getPosts();
        await localDataSource.setPosts(posts: response);
        return Right(response);
      } else {
        final response = await localDataSource.getPosts();
        return Right(response);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on EmptyCashException {
      return Left(EmptyCashFailure());
    }
  }

  @override
  Future<Either<Failure, PostsModel>> showPost({required int id}) async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.showPost(id: id);
        return Right(response);
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on EmptyCashException {
      return Left(EmptyCashFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePosts({required PostsModel post}) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.updatePosts(post: post);
        return Right(unit);
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

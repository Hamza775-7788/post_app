import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/featuers/posts/controller/posts_controller.dart';

class AddUpdatePostViewModel {
  final int? id;
  final Function updateUi;
  String addTitle = "Add Post";
  String updateTitle = "Post Details";

  AddUpdatePostViewModel({required this.updateUi, required this.id}) {
    getData();
  }

  PostsControllerImpl _controllerImpl = Get.find();

  late TextEditingController titleController;
  late TextEditingController bodyController;
  String titleLable = "Title";
  String bodyLable = "Body";
  String addLable = "Add";
  String saveLable = "Save";
  String deleteLable = "Delete";
  String? titleError;
  String? bodyError;
  onAdd() {
    if (titleController.text.isEmpty) {
      titleError = "the title is requierd ";
      updateUi();
    } else {
      titleError = null;
      updateUi();
    }

    if (bodyController.text.isEmpty) {
      bodyError = "the Body is requierd ";
      updateUi();
    } else {
      bodyError = null;
      updateUi();
    }
    if (titleController.text.isNotEmpty && bodyController.text.isNotEmpty) {
      PostsModel postsModel = PostsModel(
        id: 0,
        userId: 0,
        title: titleController.text,
        body: bodyController.text,
      );
      _controllerImpl.addPost(post: postsModel);
    }
  }

  String? get detailsErorr => _controllerImpl.detailsErorr;
  onUpdate() {
    if (titleController.text.isEmpty) {
      titleError = "the title is requierd ";
      updateUi();
    } else {
      titleError = null;
      updateUi();
    }

    if (bodyController.text.isEmpty) {
      bodyError = "the Body is requierd ";
      updateUi();
    } else {
      bodyError = null;
      updateUi();
    }
    if (titleController.text.isNotEmpty && bodyController.text.isNotEmpty) {
      PostsModel postsModel = PostsModel(
        id: postDetails?.id ?? 0,
        userId: postDetails?.userId ?? 0,
        title: titleController.text,
        body: bodyController.text,
      );
      _controllerImpl.updatePost(post: postsModel);
    }
  }

  onDelete() {
    _controllerImpl.deletePosts(id: id!);
  }

  onClear() {
    _controllerImpl.postDetils = null;
    _controllerImpl.detailsErorr = null;
  }

  PostsModel? get postDetails => _controllerImpl.postDetils;
  bool isLoding = true;
  setData() {
    print("==========");
    if (id != null && postDetails != null) {
      titleController.text = postDetails?.title ?? "";
      bodyController.text = postDetails?.body ?? "";
    }
  }

  getData() async {
    if (id != null) {
      await _controllerImpl.showPosts(id: id!);
      isLoding = false;
      setData();
      updateUi();
    }
  }
}

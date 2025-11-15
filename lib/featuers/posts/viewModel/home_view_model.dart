import 'package:get/get.dart';
import 'package:post_app/core/entity/post_entity.dart';
import 'package:post_app/featuers/posts/controller/posts_controller.dart';
import 'package:post_app/featuers/posts/view/add_update_post_view_page.dart';

class HomeViewModel {
  final Function onUpdate;
  String title = "Post App ";

  HomeViewModel({required this.onUpdate}) {
    getData();
  }
  PostsControllerImpl _controllerImpl = Get.put(PostsControllerImpl());

  bool isLoding = false;
  getData() async {
    isLoding = true;
    onUpdate();
    await _controllerImpl.getPosts();
    isLoding = false;
    onUpdate();
  }

  List<PostsModel> get posts => _controllerImpl.posts;

  goToDetalls(int id) {
    Get.to(() => AddUpdatePostViewPage(id: id));
  }

  onAdd() {
    Get.to(() => AddUpdatePostViewPage());
  }
}

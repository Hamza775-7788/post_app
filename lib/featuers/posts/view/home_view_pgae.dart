import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/featuers/posts/controller/posts_controller.dart';
import 'package:post_app/featuers/posts/viewModel/home_view_model.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = HomeViewModel(
      onUpdate: () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: GetBuilder<PostsControllerImpl>(
        builder: (controller) {
          if (viewModel.isLoding) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              final post = viewModel.posts[index];

              return ListTile(
                onTap: () {
                  viewModel.goToDetalls(post.id);
                },
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

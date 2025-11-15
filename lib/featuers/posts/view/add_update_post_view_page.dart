import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:post_app/core/sherad/buttons.dart';
import 'package:post_app/featuers/posts/controller/posts_controller.dart';
import 'package:post_app/featuers/posts/viewModel/add_update_post_view_model.dart';

class AddUpdatePostViewPage extends StatefulWidget {
  final int? id;

  const AddUpdatePostViewPage({this.id, super.key});

  @override
  State<AddUpdatePostViewPage> createState() => _AddUpdatePostViewPageState();
}

class _AddUpdatePostViewPageState extends State<AddUpdatePostViewPage> {
  late AddUpdatePostViewModel viewModel;

  @override
  void initState() {
    viewModel = AddUpdatePostViewModel(
      id: widget.id,
      updateUi: () {
        setState(() {});
      },
    );
    viewModel.titleController = TextEditingController();
    viewModel.bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.bodyController.dispose();
    viewModel.titleController.dispose();
    viewModel.onClear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id == null ? viewModel.addTitle : viewModel.updateTitle,
        ),
      ),
      body: GetBuilder<PostsControllerImpl>(
        builder: (controller) {
          if (widget.id != null && viewModel.isLoding) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.detailsErorr != null) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),

                    child: Image.asset(
                      "assets/icons/offline_icon.png",
                      height: 50,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(viewModel.detailsErorr!)],
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TextFormField(
                    controller: viewModel.titleController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      errorText: viewModel.titleError,
                      hintText: viewModel.titleLable,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      errorText: viewModel.bodyError,
                      hintText: viewModel.bodyLable,
                    ),
                    controller: viewModel.bodyController,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                if (widget.id == null)
                  SliverToBoxAdapter(
                    child: MyGenralButton(
                      onTap: () {
                        viewModel.onAdd();
                      },
                      text: viewModel.addLable,
                    ),
                  ),
                if (widget.id != null)
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: MyGenralButton(
                            color: Colors.green,
                            onTap: () {
                              viewModel.onUpdate();
                            },
                            text: viewModel.saveLable,
                          ),
                        ),
                        Expanded(
                          child: MyGenralButton(
                            color: Colors.red,
                            onTap: () {
                              viewModel.onDelete();
                            },
                            text: viewModel.deleteLable,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

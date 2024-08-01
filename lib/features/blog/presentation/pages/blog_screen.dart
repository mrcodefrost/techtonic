import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techtonic_blog_app/features/blog/presentation/pages/add_new_blog_screen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, AddNewBlogScreen.route());
              },
              icon: const Icon(CupertinoIcons.add_circled)),
        ],
      ),
    );
  }
}

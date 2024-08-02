import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techtonic_blog_app/core/common/widgets/loader.dart';
import 'package:techtonic_blog_app/core/utils/show_snackbar.dart';
import 'package:techtonic_blog_app/features/blog/domain/entities/blog.dart';
import 'package:techtonic_blog_app/features/blog/domain/entities/blog.dart';
import 'package:techtonic_blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:techtonic_blog_app/features/blog/presentation/pages/add_new_blog_screen.dart';
import 'package:techtonic_blog_app/features/blog/presentation/widgets/blog_card.dart';

class BlogScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogScreen());

  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogGetAllBlogsEvent());
  }

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
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Center(child: Loader());
          }

          if (state is BlogDisplaySuccess) {
            return ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) {
                  final blog = state.blogs[index];
                  return BlogCard(blog: blog, color: Colors.red);
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}

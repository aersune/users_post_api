import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_api/models/posts_model.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {


  List<Post> postsList =  [];

  void getPostsFromApi() async {
    PostsApi.getPosts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        postsList = list.map((model) => Post.fromJson(model)).toList();
      });
    });
  }


  @override
  void initState() {
    super.initState();
    getPostsFromApi();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'),),
      body: postsList.isEmpty ? const Center(child: CupertinoActivityIndicator(radius: 35,),)  : Flexible(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: postsList.length,
            itemBuilder: (context,i){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.2)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(postsList[i].title.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10,),
                    Text(postsList[i].body.toString(), style: const TextStyle(fontSize: 16),)
                  ],
                ),
              );
            }),
      )
    );
  }
}

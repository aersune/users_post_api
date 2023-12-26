import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_api/details_screen.dart';
import 'package:users_api/models/users_model.dart';
import 'package:users_api/posts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All users'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const PostsScreen()));
              }, icon: const Icon(Icons.post_add_sharp)))
        ],
      ),
      body: FutureBuilder(
          future: getUsersList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(user: snapshot.data![i],)));
                        },
                        child: Card(
                          color: i % 2 == 0
                              ? Colors.greenAccent.withOpacity(0.5)
                              : null,
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(snapshot.data![i].name.toString() ,style: TextStyle(color: i % 2 == 0
                              ? Colors.deepPurple
                              : null,),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(snapshot.data?[i].phone ?? '',),
                                Text(snapshot.data?[i].email ?? ''),
                              ],
                            ),
                            trailing: Text(snapshot.data?[i].email ?? ''),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }),
    );
  }
}

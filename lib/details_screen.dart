import 'package:flutter/material.dart';
import 'package:users_api/models/users_model.dart';

class DetailsScreen extends StatelessWidget {
  final User user;
  const DetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.toString()),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child:  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          const CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.person,
              size: 70,
            ),
          ),
          const SizedBox(height: 50),
          Text(user.name.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          const SizedBox(height: 20),
          userInfo('Phone: ', user.phone.toString()),
          userInfo('Email: ', user.email.toString()),
          userInfo('address: ', user.address!.city.toString() ?? ''),
          userInfo('Company: ', user.company!.name.toString() ?? ''),
        ]),
      ),
    );
  }
  Widget userInfo(String title,String text){
    return  Row(children: [
      const SizedBox(width: 15,),
    Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, letterSpacing: 1.5),),
    Text(text,style: const TextStyle( fontSize: 16, letterSpacing: 1.5, fontStyle: FontStyle.italic, height: 2),)
    ]);
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_api/models/images_model.dart';
import 'package:http/http.dart' as http;

class ImageGenerator extends StatefulWidget {
  const ImageGenerator({Key? key}) : super(key: key);

  @override
  State<ImageGenerator> createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {


  TextEditingController controller = TextEditingController();
  var searchResult = '';
  var searchNumb = Random().nextInt(10);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('City'), backgroundColor: Colors.transparent,elevation: 0,),
extendBody: false,

        resizeToAvoidBottomInset: false,
        body:  Stack(
          children: [
            FutureBuilder<YandexImage>(
                future: getImages(searchResult.isNotEmpty? searchResult : 'New york'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return  Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(snapshot.data!.imagesResults![searchNumb].thumbnail.toString() ?? '',),fit: BoxFit.cover)
                      ),
                    );
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  label: const Text('Enter city'),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffix:  IconButton(onPressed: (){
                    setState(() {
                      if(controller.text == searchResult ){
                        searchNumb = Random().nextInt(10);
                      }
                      else  if(controller.text.isNotEmpty){
                        searchResult = controller.text;
                      }
                      else{
                        null;
                      }
                    });
                  }, icon: const Icon(Icons.search),),

                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

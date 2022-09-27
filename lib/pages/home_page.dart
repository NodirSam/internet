import 'package:flutter/material.dart';

import '../model/post_madel.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var post = Post(id: 1,title: "PDP",body: "Online",userId: 1);
    _apiPostList();
  }

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}
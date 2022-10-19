import 'dart:convert';



import 'package:http/http.dart' as http;
import 'package:randompeople/models/post.dart';
class PostAPIHelper{
  PostAPIHelper._();

  static final PostAPIHelper postAPIHelper = PostAPIHelper._();

  Future<List<Peoples>?> fetchSinglePost()async{
    http.Response response = await http.get(Uri.parse("https://randomuser.me/api/"));
    print("+++++++++++++++++++++++++++++++++++++++++++++");
    print("+++++++++++++++++++++++++++++++++++++++++++++");
    print(response.body);
    print("+++++++++++++++++++++++++++++++++++++++++++++");
    print("+++++++++++++++++++++++++++++++++++++++++++++");

    if(response.statusCode ==200){
     // Map<String,dynamic> decodedData = jsonDecode(response.body);

      //Peoples peoples = Peoples.fromMap(data:decodedData);
       //List<dynamic> decodedData = data["results"];
     // Peoples allPosts =Peoples.fromMap(data:decodedData) ;
      Map<String, dynamic> data = jsonDecode(response.body);

      print(data);

      List<dynamic> decodedData = data["results"];

      List<Peoples> peopleData = decodedData.map((e) => Peoples.fromMap(data: e),).toList();

      return peopleData;


    }
    return null;
  }
}
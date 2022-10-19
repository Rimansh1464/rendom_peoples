import 'package:flutter/material.dart';
import 'package:randompeople/helpers/post_api_helper.dart';
import 'package:randompeople/models/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PostAPIHelper.postAPIHelper.fetchSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      body: FutureBuilder(
          future: PostAPIHelper.postAPIHelper.fetchSinglePost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
               List<Peoples> data = snapshot.data;
              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.keyboard_backspace),
                            Text("Random Peoples",style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                                fontWeight: FontWeight.w500)),

                              IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(Icons.refresh),
                              ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //(data.last.gender == "female") ?Icon(Icons.female_outlined,size: 200,):Icon(Icons.male_outlined,size: 200,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(height: 150,width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(data.last.large)),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                              // boxShadow: [
                              //   new BoxShadow(
                              //     color: Colors.grey,
                              //     blurRadius: 10.0,
                              //     offset: Offset(5, 6),
                              //   ),
                              // ],
                              color: Colors.white),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children:  [

                                  (data.last.gender == "female") ?Icon(Icons.female_outlined,size: 80,):Icon(Icons.male_outlined,size: 80,),

                                  Flexible(
                                    child: Text("${data.last.title}. ${data.last.first} ${data.last.last}",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Divider(
                                height: 60,
                                color: Colors.grey,
                                endIndent: 15,
                                indent: 15,
                                thickness: 1,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'Gender',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text('${data.last.gender}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      width: 10,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'City',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text('${data.last.city}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      width: 10,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Contry',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text("${data.last.country}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 60,
                                color: Colors.grey,
                                endIndent: 15,
                                indent: 15,
                                thickness: 1,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'Age',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text('${data.last.age}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      width: 10,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'phone',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text('${data.last.phone}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}

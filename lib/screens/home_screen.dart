import 'package:evoke_news_api/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../api_service/get_news_service.dart';
import '../model/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
      future: GetnewsService.getNewsWithModel(),
      builder: (context, AsyncSnapshot<NewsModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.articles!.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                    itemBuilder: (context, index) {
                      final news = snapshot.data!.articles![index];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                            image: news.urlToImage,
                                            title: news.title,
                                            author: news.author,
                                            description: news.description),
                                      ));
                                },
                                child: Container(
                                  height: height * 0.15,
                                  width: width * 0.30,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!.articles![index].urlToImage
                                              .toString()),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        snapshot.data!.articles![index].title
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(height: 10),
                                    Text(
                                        snapshot
                                            .data!.articles![index].publishedAt
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

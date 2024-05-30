import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyews_app/models/news_model.dart';
import 'package:nyews_app/pages/news_detail/news_detail_page.dart';
import 'package:nyews_app/repositories/repository.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> listNews = [];
  Repository repository = Repository();

  getData() async {
    List<News> newsData = await repository.getData();
    setState(() {
      listNews = newsData;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final news = listNews[index];
          final formattedDate =
              DateFormat('dd/MM/yyyy').format(news.publishedAt);

          return GestureDetector(
            onTap: () {
              Get.to(() => NewsDetailPage(newsId: news.id));
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      news.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: const Icon(Icons.image, color: Colors.white),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: listNews.length,
      ),
    );
  }
}

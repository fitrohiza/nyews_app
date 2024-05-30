import 'package:flutter/material.dart';
import 'package:nyews_app/models/news_model.dart';
import 'package:nyews_app/repositories/repository.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;
  const NewsDetailPage({required this.newsId, Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late Future<News> newsDetail;
  final Repository repository = Repository();

  @override
  void initState() {
    newsDetail = repository.getDataById(widget.newsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
        centerTitle: true,
      ),
      body: FutureBuilder<News>(
        future: newsDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final news = snapshot.data!;
            final formattedDate =
                DateFormat('dd/MM/yyyy').format(news.publishedAt);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      news.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey,
                          child: const Icon(Icons.image,
                              color: Colors.white, size: 50),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        news.summary,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}

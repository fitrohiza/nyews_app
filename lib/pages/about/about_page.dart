import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Application'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      75), // Setengah dari width atau height
                  child: Image(
                    image: const AssetImage('assets/images/logo.png'),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                        child: const Icon(Icons.image, color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nyews Application V.0.1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Tech News Simplified',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

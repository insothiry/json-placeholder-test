import 'package:flutter/material.dart';
import 'album.dart'; // Import the Album class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<Album>(
        future: fetchAlbum(), // Call the fetchAlbum function
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // If data is available, display the title
            return Scaffold(
              appBar: AppBar(
                title: const Text('Album Example'),
              ),
              body: Center(
                child: Text(snapshot.data!.title),
              ),
            );
          } else if (snapshot.hasError) {
            // If there's an error, display the error message
            return Scaffold(
              appBar: AppBar(
                title: const Text('Album Example'),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          } else {
            // By default, show a loading spinner
            return Scaffold(
              appBar: AppBar(
                title: const Text('Album Example'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

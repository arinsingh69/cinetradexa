import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'api.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineTradexa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CineTradexa'),
      ),
      body: Column(
        children: [
          // Search box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  query = text;
                });
                if (query.isNotEmpty) {
                  Provider.of<MovieProvider>(context, listen: false)
                      .searchMovies(query); // Perform the search
                }
              },
            ),
          ),
          // Movie List
          Expanded(
            child: query.isEmpty
                ? Center(child: Text('Enter a movie name to search'))
                : Consumer<MovieProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (provider.movies == null ||
                    provider.movies!.isEmpty) {
                  return Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: provider.movies!.length,
                    itemBuilder: (context, index) {
                      final movie = provider.movies![index];
                      return ListTile(
                        leading: movie['Poster'] != 'N/A'
                            ? Image.network(movie['Poster'])
                            : Icon(Icons.movie),
                        title: Text(movie['Title']),
                        subtitle: Text(movie['Year']),
                        trailing: Text('IMDB: ${movie['imdbID']}'),);},
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

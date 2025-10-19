import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../search/search_delegate.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //CardSwiper
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Listado horizontal de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            MovieSlider(
              movies: moviesProvider.topRatedMovies,
              title: 'Top',
              onNextPage: () => moviesProvider.getTopMovies(),
            ),
            MovieSlider(
              movies: moviesProvider.upcomingMovies,
              title: 'A estrenar',
              onNextPage: () => moviesProvider.getUpComingMovies(),
            ),
          ],
        ),
      ),
    );
  }
}

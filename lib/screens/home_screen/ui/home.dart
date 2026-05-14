import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/app_sizes.dart';
import '../logic/movie_states/movie_states.dart';
import '../logic/movie_view_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = context.height;
    var screenWidth = context.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/OnBoarding6.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.4)),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    'assets/images/Available Now.png',
                    width: screenWidth * 0.6,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  BlocBuilder<MovieCubit, MovieState>(
                    builder: (context, state) {
                      final cubit = context.read<MovieCubit>();
                      if (state is MovieLoading && cubit.latestMovies == null) {
                        return _buildLoading(300);
                      }

                      final movies = cubit.latestMovies ?? [];
                      return CarouselSlider.builder(
                        itemCount: movies.length,
                        options: CarouselOptions(
                          height: 300,
                          enlargeCenterPage: true,
                          viewportFraction: 0.75,
                          enableInfiniteScroll: true,
                        ),
                        itemBuilder: (context, index, realIndex) =>
                            _buildCarouselItem(movies[index]),
                      );
                    },
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Image.asset(
                    'assets/images/Watch Now.png',
                    width: screenWidth * 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                              .watch<MovieCubit>()
                              .currentGenre
                              .toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See More >',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ),

                  BlocBuilder<MovieCubit, MovieState>(
                    builder: (context, state) {
                      final cubit = context.read<MovieCubit>();
                      if (state is MovieLoading) return _buildLoading(150);

                      final movies = cubit.categoryMovies ?? [];
                      return SizedBox(
                        height: screenHeight * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                          ),
                          itemCount: movies.length,
                          itemBuilder: (context, index) =>
                              _buildListItem(movies[index], screenWidth),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(double height) => SizedBox(
    height: height,
    child: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.yellow,
        size: 50,
      ),
    ),
  );

  Widget _buildCarouselItem(dynamic movie) => Stack(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(movie.mediumCoverImage ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 15,
        left: 15,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                movie.rating?.toString() ?? '0',
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 16),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _buildListItem(dynamic movie, double screenWidth) => Container(
    width: screenWidth * 0.3,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: NetworkImage(movie.mediumCoverImage ?? ''),
        fit: BoxFit.cover,
      ),
    ),
  );
}

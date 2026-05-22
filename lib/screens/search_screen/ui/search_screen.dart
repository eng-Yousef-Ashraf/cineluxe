import 'package:cineluxe/screens/search_screen/logic/search_view_model.dart';
import 'package:cineluxe/screens/search_screen/logic/states/search_states.dart';
import 'package:cineluxe/widgets/customized_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../../home_screen/ui/movie_details.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [

            /// SEARCH FIELD
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              child: CustomizedTextFormField(
                textInputAction: TextInputAction.search,
                hintText: 'Search',
                prefixIcon: Image.asset(
                  AppAssets.searchLogo,
                  width: width * 0.05,
                ),
                onChanged: (value) {
                  context.read<SearchViewModel>().searchMovies(value);
                },
              ),
            ),

            /// BODY
            Expanded(
              child: BlocBuilder<SearchViewModel, SearchStates>(
                builder: (context, state) {

                  /// LOADING
                  if (state is SearchMoviesLoadingState) {
                    return Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.yellow,
                        size: 50,
                      ),
                    );
                  }

                  /// SUCCESS
                  if (state is SearchMoviesSuccessState) {
                    final movies = state.movies;

                    /// EMPTY RESULT
                    if (movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    /// GRID VIEW
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                      ),
                      child: GridView.builder(
                        itemCount: movies.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: width * 0.04,
                          mainAxisSpacing: height * 0.02,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final movie = movies[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MovieDetailsScreen(
                                    movieId: movie.id ?? 0,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /// IMAGE
                                Expanded(
                                  child: Stack(
                                    children: [

                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                        child: Image.network(
                                          movie.mediumCoverImage ?? '',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Icon(
                                                Icons.broken_image,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      /// RATING
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: Container(
                                          padding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                movie.rating?.toString() ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 6),

                                /// TITLE
                                Text(
                                  movie.title ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }

                  /// INITIAL STATE
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.popcorn),
                        const SizedBox(height: 10),
                        const Text(
                          "Search for movies",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
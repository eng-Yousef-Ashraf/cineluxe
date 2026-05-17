import 'package:cineluxe/screens/Movie%20Suggest/ui/widgets/category_chip.dart';
import 'package:cineluxe/screens/Movie%20Suggest/ui/widgets/movie_card.dart';
import 'package:cineluxe/screens/Movie%20Suggest/ui/widgets/trending_section.dart';
import 'package:cineluxe/utils/app_colors.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:flutter/material.dart';

class UiMovieSuggest extends StatelessWidget {
  const UiMovieSuggest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// TITLE
              Padding(
                padding: const EdgeInsets.all(16),

                child: Text(
                  "Discover Movies",
                  style: AppStyles.white20Bold.copyWith(fontSize: 30),
                ),
              ),

              /// SEARCH
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: AppColors.textFormFieldBg,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: const TextField(
                    style: TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search movies...",
                      hintStyle: TextStyle(color: Colors.grey),

                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// CATEGORIES
              SizedBox(
                height: 45,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    categoryItem("All", true),
                    categoryItem("Action", false),
                    categoryItem("Drama", false),
                    categoryItem("Comedy", false),
                    categoryItem("Sci-Fi", false),
                    categoryItem("Horror", false),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// POPULAR MOVIES
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Popular Movies", style: AppStyles.white20Bold),

                    Text("See All", style: AppStyles.yellow14W400),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 300,

                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) {
                    return const MovieCard(
                      image:
                          "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
                      title: "Doctor Strange",
                      rating: "8.5",
                    );
                  },

                  separatorBuilder: (_, __) => const SizedBox(width: 16),

                  itemCount: 5,
                ),
              ),

              const SizedBox(height: 30),

              /// TRENDING
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Trending", style: AppStyles.white20Bold),

                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.yellowColor,
                      size: 18,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 280,

                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  scrollDirection: Axis.horizontal,

                  itemBuilder: (_, index) {
                    return const TrendingMovieCard(
                      image:
                          "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c",
                      title: "Interstellar",
                      rating: "9.1",
                      year: "2014",
                    );
                  },

                  separatorBuilder: (_, __) => const SizedBox(width: 16),

                  itemCount: 5,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

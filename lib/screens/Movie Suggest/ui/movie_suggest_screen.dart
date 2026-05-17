import 'package:cineluxe/screens/Movie%20Suggest/ui/widgets/movie_card.dart';
import 'package:cineluxe/utils/app_colors.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MovieSuggestScreen extends StatelessWidget {
  const MovieSuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// HERO SECTION
              Stack(
                children: [
                  Container(
                    height: height * 0.65,
                    width: double.infinity,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(
                    height: height * 0.65,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          Colors.black.withOpacity(.2),
                          AppColors.bgColor,
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    right: 20,

                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black.withOpacity(.4),

                      child: const Icon(
                        Icons.search,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 40,
                    left: 20,
                    right: 20,

                    child: Column(
                      children: [
                        Text(
                          "Discover Movies",

                          style: AppStyles.white20Bold.copyWith(fontSize: 32),

                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: height * 0.015),

                        Text(
                          "Explore a vast universe of movies and find your next favorite film.",

                          style: AppStyles.white14W400.copyWith(
                            color: Colors.grey.shade300,
                            height: 1.5,
                          ),

                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: height * 0.04),

                        Container(
                          width: width * 0.45,
                          height: height * 0.065,

                          decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Center(
                            child: Text(
                              "Next",

                              style: AppStyles.black20Bold.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: AppColors.textFormFieldBg,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: const TextField(
                    style: TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                      border: InputBorder.none,

                      icon: Icon(Icons.search, color: AppColors.yellowColor),

                      hintText: "Search movies...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              /// CATEGORIES
              SizedBox(
                height: 40,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    _categoryItem("All", true),
                    _categoryItem("Action", false),
                    _categoryItem("Drama", false),
                    _categoryItem("Comedy", false),
                    _categoryItem("Sci-Fi", false),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

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

              SizedBox(height: height * 0.02),

              SizedBox(
                height: height * 0.33,

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

                  separatorBuilder: (_, __) => const SizedBox(width: 14),

                  itemCount: 6,
                ),
              ),

              SizedBox(height: height * 0.04),

              /// TRENDING SECTION
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

              SizedBox(height: height * 0.02),

              SizedBox(
                height: height * 0.25,

                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  scrollDirection: Axis.horizontal,
                  itemCount: 5,

                  separatorBuilder: (_, __) => const SizedBox(width: 14),

                  itemBuilder: (_, index) {
                    return Container(
                      width: width * 0.38,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c",
                          ),

                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.textFormFieldBg,

        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

Widget _categoryItem(String text, bool selected) {
  return Container(
    margin: const EdgeInsets.only(left: 16),

    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

    decoration: BoxDecoration(
      color: selected ? AppColors.yellowColor : AppColors.textFormFieldBg,

      borderRadius: BorderRadius.circular(14),
    ),

    child: Text(
      text,

      style: TextStyle(
        color: selected ? Colors.black : Colors.white,

        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

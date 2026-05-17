import 'package:cineluxe/utils/app_colors.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// POSTER
            Stack(
              children: [
                SizedBox(
                  height: height * 0.55,
                  width: double.infinity,

                  child: Image.network(
                    "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba",
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: height * 0.55,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,

                      colors: [AppColors.bgColor, Colors.transparent],
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,

                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.5),

                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Doctor Strange",

                        style: AppStyles.white20Bold.copyWith(fontSize: 30),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.star, color: AppColors.yellowColor),

                          const SizedBox(width: 6),

                          Text("8.5", style: AppStyles.yellow16W400),

                          const SizedBox(width: 16),

                          Text("2022", style: AppStyles.white14W400),

                          const SizedBox(width: 16),

                          Text("Action", style: AppStyles.white14W400),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),

                          decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Center(
                            child: Text(
                              "Watch Now",
                              style: AppStyles.black20Bold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.textFormFieldBg,

                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// SUMMARY
                  Text("Summary", style: AppStyles.white20Bold),

                  const SizedBox(height: 10),

                  Text(
                    "Doctor Strange travels into the multiverse to face a mysterious new threat. A visually stunning adventure filled with action, magic, and mind-bending realities.",

                    style: AppStyles.white14W400.copyWith(
                      color: Colors.grey.shade400,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// CAST
                  Text("Cast", style: AppStyles.white20Bold),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 100,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text("Actor", style: AppStyles.white14W400),
                          ],
                        );
                      },

                      separatorBuilder: (_, __) => const SizedBox(width: 16),

                      itemCount: 5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// SIMILAR MOVIES
                  Text("Similar Movies", style: AppStyles.white20Bold),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 220,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (_, index) {
                        return Container(
                          width: width * 0.35,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),

                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },

                      separatorBuilder: (_, __) => const SizedBox(width: 14),

                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

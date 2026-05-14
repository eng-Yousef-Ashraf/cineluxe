import 'package:cineluxe/utils/app_assets.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:cineluxe/widgets/customized_elevated_button.dart';
import 'package:cineluxe/widgets/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../logic/movie_view_model.dart';
import '../logic/movie_states/movie_states.dart';
import '../../../models/movie_response.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  void initState() {
    super.initState();

    context.read<MovieCubit>().getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {

          if (state is MovieLoading) {
            return  Center(
              child:  LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.yellow,
                size: 50,
              ),
            );
          }

          if (state is MovieDetailsSuccess) {
            final Movies movie = state.movie;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        movie.largeCoverImage ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_back_ios),color: Colors.white,iconSize: 30,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined,color: Colors.white),iconSize: 30,)
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(AppAssets.watchLogo),
                        ),
                      ),
                      Positioned.fill(child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(movie.title ?? '',style:  GoogleFonts.roboto(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700)),
                      ))
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Center(child: Text('${movie.year}',style: AppStyles.grey20W700,)),
                  SizedBox(height: height * 0.02),
                  CustomizedElevatedButton(
                    paddingHeight: 0.02,
                      backgroundColor: AppColors.redColor,
                      onPressed: (){}, child: Text('Watch',style: AppStyles.grey20W700.copyWith(color: AppColors.whiteColor),)),
                  SizedBox(height: height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     ReusableContainer(icon: Image.asset(AppAssets.likes), text: '15'),
                      ReusableContainer(icon: Image.asset(AppAssets.clock), text: "${movie.runtime}"),
                      ReusableContainer(icon: Image.asset(AppAssets.star), text: "${movie.rating}"),
                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                  Text('Screen Shots',style: AppStyles.white24W700,),
                  SizedBox(height: height * 0.02,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.network('${}')),
                  ),
                ],
              ),
            );
          }

          if (state is MovieError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
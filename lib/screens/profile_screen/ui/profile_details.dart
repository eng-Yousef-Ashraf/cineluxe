import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_sizes.dart';
import '../../../widgets/customized_elevated_button.dart';
import '../../update_profile_screen/logic/states/update_profile_states.dart';
import '../../update_profile_screen/logic/update_profile_functions.dart';
import '../../update_profile_screen/logic/update_profile_view_model.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String avatar = "";
  String name = '';
  final List<String> avatars = List.generate(9, (i) => "avatar${i + 1}");
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    List<Widget> twoTabs = [
      Column(
        children: [
          ImageIcon(
            AssetImage(AppAssets.watchlistLogo),
            size: 40,
            color: AppColors.yellowColor,
          ),
          Text(
            'Watch List',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
      Column(
        children: [
          ImageIcon(
            AssetImage(AppAssets.historyLogo),
            size: 40,
            color: AppColors.yellowColor,
          ),
          Text(
            'History',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF282A28).withValues(alpha: 0.95),
      body: SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              setState(() {
                avatar = state.user.avatar ?? "";
                name = state.user.name ?? "";
              });
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.yellowColor,
                  size: 50,
                ),
              );
            }
            if (state is UserError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            if (state is UserLoaded) {
              final user = state.user;
              final watchlist = user.watchlist ?? [];
              final history = user.history ?? [];
              return Column(
                children: [
                  SizedBox(height: height * 0.06),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: height * 0.01,
                          children: [
                            Container(
                              width: width * 0.28,
                              height: width * 0.28,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: avatar.isNotEmpty
                                    ? Image.asset(
                                        UpdateProfileFunctions.getAvatarPath(
                                          avatar,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: width * 0.2,
                                        color: Colors.white70,
                                      ),
                              ),
                            ),
                            Text(
                              name,
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${watchlist.length}',
                              style: GoogleFonts.roboto(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Watchlist',
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${history.length}',
                              style: GoogleFonts.roboto(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'History',
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomizedElevatedButton(
                            paddingHeight: 0.02,
                            onPressed: () async {
                              await Navigator.pushNamed(
                                context,
                                AppRoutes.updateProfileScreen,
                              );
                              context.read<UserCubit>().loadUser();
                            },
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.bgColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          flex: 1,
                          child: CustomizedElevatedButton(
                            backgroundColor: AppColors.redColor,
                            paddingHeight: 0.02,
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.loginScreen,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Exit',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Icon(Icons.logout, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  DefaultTabController(
                    length: 2,
                    child: Expanded(
                      child: Column(
                        children: [
                          TabBar(
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelPadding: EdgeInsets.zero,
                            tabs: twoTabs,
                            indicatorColor: AppColors.yellowColor,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                // ================= WATCHLIST =================
                                watchlist.isEmpty
                                    ? Center(
                                        child: Image.asset(AppAssets.popcorn),
                                      )
                                    : ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                          vertical: height * 0.02,
                                        ),
                                        itemCount: watchlist.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: height * 0.02),
                                        itemBuilder: (context, index) {
                                          final movie = watchlist[index];
                                          return Container(
                                            height: height * 0.18,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1F1F1F),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                // POSTER
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    movie.mediumCoverImage ??
                                                        '',
                                                    width: width * 0.32,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (_, __, ___) {
                                                      return Container(
                                                        width: width * 0.32,
                                                        color: Colors.grey,
                                                        child: const Icon(
                                                          Icons.broken_image,
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ), // INFO
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical:
                                                              height * 0.015,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          movie.title ?? '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.roboto(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${movie.year}',
                                                          style:
                                                              GoogleFonts.roboto(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                              ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.01,
                                                            ),
                                                            Text(
                                                              '${movie.rating}',
                                                              style:
                                                                  GoogleFonts.roboto(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ), // ================= HISTORY =================
                                history.isEmpty
                                    ? Center(
                                        child: Image.asset(AppAssets.popcorn),
                                      )
                                    : ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                          vertical: height * 0.02,
                                        ),
                                        itemCount: history.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: height * 0.02),
                                        itemBuilder: (context, index) {
                                          final movie = history[index];
                                          return Container(
                                            height: height * 0.18,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1F1F1F),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    movie.mediumCoverImage ??
                                                        '',
                                                    width: width * 0.32,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (_, __, ___) {
                                                      return Container(
                                                        width: width * 0.32,
                                                        color: Colors.grey,
                                                        child: const Icon(
                                                          Icons.broken_image,
                                                          color: Colors.white,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: width * 0.04),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical:
                                                              height * 0.015,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          movie.title ?? '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              GoogleFonts.roboto(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${movie.year}',
                                                          style:
                                                              GoogleFonts.roboto(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                              ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.01,
                                                            ),
                                                            Text(
                                                              '${movie.rating}',
                                                              style:
                                                                  GoogleFonts.roboto(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

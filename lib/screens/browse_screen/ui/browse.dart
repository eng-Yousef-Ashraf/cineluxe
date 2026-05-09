import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_styles.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> genre=[
      'Action',
      'Adventure',
      'Animation',
      'Biography',
      'Comedy',
      'Crime',
      'Documentary',
      'Drama',
      'Family',
      'Fantasy',
      'Film-Noir',
      'Game-Show',
      'History',
      'Horror',
      'Music',
      'Musical',
      'Mystery',
      'News',
      'Reality-TV',
      'Romance',
      'Sci-Fi',
      'Short',
      'Sport',
      'Talk-Show',
      'Thriller',
      'War',
      'Western',
    ];
    var width = context.width;
    var height = context.height;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: width*0.02, vertical: height*0.02),
          child: Column(
            spacing: height*0.02,
            children: [
              SizedBox(
                height: height*0.06,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      selectedIndex=index;
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: width*0.04, vertical: height*0.013),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        color: selectedIndex==index?AppColors.yellowColor:AppColors.blackColor,
                        border: Border.all(
                          color: AppColors.yellowColor,
                          width: 2
                        )
                      ),
                      child: Text(genre[index],style:selectedIndex==index?AppStyles.black20bold.copyWith(fontSize: 16):AppStyles.yellow20bold.copyWith(fontSize: 16),),
                    ),
                  );
                }
                    , separatorBuilder:(context, index) => SizedBox(width:width*0.02 ,)
                    , itemCount:genre.length ),
              ),
              Expanded(child: ListView.separated(itemBuilder: (context, index) {
                return Row(
                  children: [
                Expanded(
                  child: Stack(
                  children: [
                    Container(
                      width: width * 0.5,
                      height: height * 0.3,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/OnBoarding6.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text('7.7 ', style: TextStyle(color: Colors.white)),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                  ),
                  ),
                  ),
                  ],
                  ),
                ),
                SizedBox(width: width*0.05,),
                Expanded(
                  child: Stack(
                  children: [
                    Container(
                      width: width * 0.5,
                      height: height * 0.3,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/OnBoarding6.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text('7.7 ', style: TextStyle(color: Colors.white)),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                  ),
                  ),
                  ),
                  ],
                  ),
                )
                  ],
                );
              }
                  , separatorBuilder: (context, index) => SizedBox(height: height*0.02,)
                  , itemCount: 10))
            ],
          ),
        ),
      ),
    );
  }
}

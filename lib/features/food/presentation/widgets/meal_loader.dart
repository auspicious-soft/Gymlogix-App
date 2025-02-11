import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
 

 

class MealLoader extends StatelessWidget {
  const MealLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child:
        
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
          ],)
        
        
      ),
    );
  }
}

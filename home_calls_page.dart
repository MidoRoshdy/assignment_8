import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class HomeCallsPage extends StatelessWidget {
  const HomeCallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Body
        Container(
          color: Colors.white,
        ),


        // Flating Botton
        Positioned(
          bottom: 16,
          right: 16,
          child: InkWell(
            onTap: (){},
            radius: 50,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  color: AppColors.primary
              ),
              child: Icon(Icons.call,color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }
}

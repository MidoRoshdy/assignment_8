import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class HomeStatusPage extends StatelessWidget {
  const HomeStatusPage({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                radius: 50,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: Colors.grey.shade300),
                  child: Icon(
                    Icons.edit,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {},
                radius: 50,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: AppColors.primary),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

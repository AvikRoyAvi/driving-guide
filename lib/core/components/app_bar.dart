import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jourapothole/core/constants/app_images.dart';
import 'package:jourapothole/features/main_tab/controller/bottom_nav_controller.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget actionChildren;
  final bool isShowProfile;
  final String? appbarTitle;

  GlobalAppBar({
    super.key,
    required this.actionChildren,
    required this.isShowProfile,
    this.appbarTitle,
  });

  final navController = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      leading:
          isShowProfile
              ? InkWell(
                onTap: () {
                  navController.changePage(4);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(AppImages.avatar),
                    radius: 20,
                  ),
                ),
              )
              : null,
      leadingWidth: isShowProfile ? 60 : null,
      title:
          isShowProfile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hey, Jasmin',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '2972 Westheimer Rd. Santa Ana',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              )
              : Text(
                appbarTitle ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
      actions: [
        actionChildren,
        // const Padding(
        //   padding: EdgeInsets.only(right: 16.0),
        //   child: Icon(Icons.notifications_none, color: Colors.grey, size: 24),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

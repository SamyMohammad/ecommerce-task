import 'package:ecommerce_task/presentation/profile/widgets/custom_shape_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadow_clip/shadow_clip.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../bloc/profile_cubit.dart';

class ProfileContentBody extends StatefulWidget {
  ProfileContentBody({
    required this.cubit,
    required this.state,
    super.key,
  });

  final ProfileCubit cubit;
  ProfileState state;

  @override
  State<ProfileContentBody> createState() => _ProfileContentBodyState();
}

class _ProfileContentBodyState extends State<ProfileContentBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildAppBar(context),
        SliverToBoxAdapter(child: SizedBox(height: 50.h)),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Samy Mohamed Ali',
              style: getBoldStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 4.h)),
      ],
    );
  }

  SliverToBoxAdapter buildAppBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0.h),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            buildCustomShape(),
            buildProfilePicture(),
            Positioned(
                top: 22.h,
                right: 0.w,
                child: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                      value: 'option1',
                      child: Text('Edit Account'),
                    ),
                    PopupMenuItem<String>(
                      value: 'option2',
                      child: Row(
                        children: [
                          const Text('Log out'),
                          const Spacer(),
                          Icon(
                            Icons.logout,
                            color: ColorManager.jobTitle,
                          )
                        ],
                      ),
                    ),
                  ],
                  onSelected: (String value) {
                    // Do something when the dropdown item is selected
                  },
                  icon: Icon(Icons.more_vert, color: Colors.white, size: 26.sp),
                ))
          ],
        ),
      ),
    );
  }

  ClipShadow buildCustomShape() {
    return ClipShadow(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      clipper: CustomShape(),
      // this is my own class which extendsCustomClipper
      child: Container(
        height: 140.h,
        color: ColorManager.primary,
      ),
    );
  }

  Positioned buildProfilePicture() {
    return Positioned(
      bottom: -45.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.passthrough,
        children: [
          CircleAvatar(
            radius: 62.0.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 59.0.r,
              backgroundColor: ColorManager.primary,
              backgroundImage: widget.cubit.image == null
                  ? null
                  : FileImage(widget.cubit.image!) as ImageProvider,
              child: widget.cubit.image == null
                  ? Image.asset(
                      ImageAssets.user,
                      height: 50.h,
                      width: 50.w,
                    )
                  : null,
            ),
          ),
          Positioned(
            right: -10,
            bottom: -10,
            child: IconButton(
              // style: ButtonStyle(iconSize: MaterialStateProperty.all(52)),
              iconSize: 60,

              color: Colors.deepOrange,
              onPressed: () {
                widget.cubit.pickImage().then((value) {});
                // Navigator.pop(context);
              },
              icon: CircleAvatar(
                radius: 22.r,
                // maxRadius: 30.r,
                // minRadius: 10.r,

                backgroundColor: Colors.grey.withOpacity(0.5),
                child: Image.asset(
                  'assets/images/photo-camera.png',
                  color: Colors.white,
                  width: 15.w,
                  height: 15.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//aa

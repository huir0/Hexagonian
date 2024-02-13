import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final ImagePicker _imagePicker = ImagePicker();
  String profileImage = '';

  static const title = '프로필 변경';
  static const description = '프로필 이미지를 선택해주세요.';

  void pickFromBasic(String imagePath) {
    profileImage = imagePath;
    setState(() {});
  }

  Future<void> pickImageFromGallary({
    required ImageSource source,
  }) async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: source);
    setState(() {
      profileImage = pickedFile!.path;
    });
  }

  Widget _buildProfileImage() {
    if (profileImage.toLowerCase().endsWith('.svg')) {
      return SLCircleAvatar(
        diameter: 92,
        imageWidget: SvgPicture.asset(profileImage),
      );
    } else {
      XFile file = XFile(profileImage);
      return SLCircleAvatar(
        diameter: 92,
        imageWidget: Image.file(
          File(file.path),
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: SLTextStyle(
            style: SLStyle.Heading_S_Bold,
            color: Colors.white,
          ).textStyle,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              onboardingNotifier.uploadNicknameProfile(
                profile: profileImage,
              );
              context.pop();
            },
            child: Text(
              '확인',
              style: SLTextStyle(
                style: SLStyle.Text_L_Regular,
                color: Colors.white,
              ).textStyle,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              description,
              style: SLTextStyle(
                style: SLStyle.Heading_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
            const SizedBox(height: 35),
            profileImage == ''
                ? SLCircleAvatar(
                    diameter: 92,
                    imageWidget:
                        SvgPicture.asset('assets/avatars/avatar_01.svg'),
                  )
                : _buildProfileImage(),
            const SizedBox(height: 50),
            GridView.builder(
              padding: const EdgeInsets.all(20),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 17,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: index != 0
                      ? () {
                          pickFromBasic(getAvatarImagePath(index));
                          setState(() {});
                        }
                      : () {
                          pickImageFromGallary(
                            source: ImageSource.gallery,
                          );
                        },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: profileImage == getAvatarImagePath(index)
                            ? true
                            : false,
                        child: Container(
                          width: 58,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: SLColor.primary,
                              width: 5,
                            ),
                          ),
                        ),
                      ),
                      SLCircleAvatar(
                        diameter: 54,
                        imageWidget: SvgPicture.asset(
                          getAvatarImagePath(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

String getAvatarImagePath(int index) {
  String formattedIndex = (index).toString().padLeft(2, '0');
  return 'assets/avatars/avatar_$formattedIndex.svg';
}

class SLCircleAvatar extends StatelessWidget {
  const SLCircleAvatar({
    super.key,
    required this.diameter,
    required this.imageWidget,
  });

  final double diameter;
  final Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: imageWidget,
    );
  }
}

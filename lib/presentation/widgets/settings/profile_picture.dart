import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 90,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/profile.png'),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: primaryColor,
              child: Icon(
                Icons.create,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

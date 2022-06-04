import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/jennie.jpg'),
            radius: 40,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kim Jennie Blackpink',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              Text(
                '@jennieblackpink',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black26),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

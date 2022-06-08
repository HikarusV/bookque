import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(context
                    .read<AccountProv>()
                    .userData!
                    .photoURL ??
                'https://image.shutterstock.com/image-vector/man-icon-vector-260nw-1040084344.jpg'),
            radius: 40,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read<AccountProv>().userData!.displayName ??
                    'Kosong broh',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              Text(
                context.read<AccountProv>().userData!.email!,
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

import 'package:bookque/presentation/pages/detail/detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/poster.dart';

class RowBooks extends StatelessWidget {
  const RowBooks({Key? key, required this.listData}) : super(key: key);
  final List listData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 208,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 124,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detail(id: listData[index]['itemid']),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: listData[index]['imageid'],
                      width: 124,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    listData[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    listData[index]['author'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8C9198),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  // static const routeName = '/about_page';

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Tentang Kami',
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', height: 115),
                    Text('Version 1.0.0', style: subTextGrey),
                    Text('Copyright © 2022 BookQue', style: subTextGrey),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                  'BookQue adalah platform berbasis aplikasi mobile yang menyediakan serta memudahkan untuk mencari dan mengunggah referensi buku, jurnal atau karya tulis lainnya yang dapat diakses dengan mudah, gratis dengan tampilan yang menarik.',
                  style: subText,
                  textAlign: TextAlign.justify),
              const SizedBox(height: 20),
              Text('Dikembangkan oleh :', style: subText),
              Text('● Abdurrachman Farras', style: subText),
              Text('● Muhammad Wildhan Kusumawardana', style: subText),
              Text('● Nazwa Sapta Pradana', style: subText),
              Text('● Yudhistira Hary Pratama', style: subText),
              const SizedBox(height: 20),
              Text('Resource Credit :', style: subText),
              Text('● Icons8', style: subText),
              Text('● Figma', style: subText),
            ],
          ),
        ),
      ),
    );
  }
}

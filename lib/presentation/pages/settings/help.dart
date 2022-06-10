import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  // static const routeName = '/help_page';

  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Bantuan',
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
              Text('Hubungi Kami', style: titleSmall),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/profile.png')),
                      Text('Faras', style: subText),
                      Text('faras@gmail.com', style: subText),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/profile.png')),
                      Text('Faras', style: subText),
                      Text('faras@gmail.com', style: subText),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/profile.png')),
                      Text('Faras', style: subText),
                      Text('faras@gmail.com', style: subText),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          child: Image.asset('assets/profile.png')),
                      Text('Faras', style: subText),
                      Text('faras@gmail.com', style: subText),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

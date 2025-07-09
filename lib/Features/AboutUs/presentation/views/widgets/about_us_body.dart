import 'package:firebase1/Features/AboutUs/presentation/views/widgets/about_us_item.dart';
import 'package:flutter/material.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        AboutUsItem(
          image: 'asset/images/aboutUs1.jpeg',
          name: 'walid siam', track: 'Flutter',
        ),
        AboutUsItem(
          image: 'asset/images/aboutUs2.jpeg',
          name: 'Abdo Ibrahime', track: 'Machine',
        ),
        AboutUsItem(
          image: 'asset/images/plant_b2.png',
          name: 'sherif Asharf', track: 'Machine',
        ),
        AboutUsItem(
          image: 'asset/images/aboutUs4.jpeg',
          name: 'Ahmed Ali', track: 'UI&UX',
        ),
        AboutUsItem(
          image: 'asset/images/aboutUs5.jpeg',
          name: 'Abdo sayed', track: 'Backend',
        ),
        AboutUsItem(
          image: 'asset/images/aboutUs6.jpeg',
          name: 'Abdo al-sayed ', track: 'Backend',
        ),
      ],
    ));
  }
}

import 'package:firebase1/Features/Home/widgets/custom_plant_image.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePlantDiseaseItem extends StatelessWidget {
  const HomePlantDiseaseItem({
    super.key,
    required this.screenWidth,
    required this.name,
    required this.description,
    required this.customHomePlantImage,
  });

  final double screenWidth;
  final String name;
  final String description;
  final CustomHomePlantImage customHomePlantImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(100, 0, 0, 0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
          child: Row(
            children: [
              customHomePlantImage,
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: screenWidth * 1.18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // const Text(
                        //   'Name: ',
                        //   style: TextStyle(
                        //     color: kHomeIconsBakColor,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        SizedBox(
                          width: screenWidth * 1.1,
                          child: Text(
                            name,
                            style: GoogleFonts.bangers(
                              textStyle: const TextStyle(
                                color: kOrangewhiteColor,
                                fontWeight: FontWeight.w100,
                                fontSize: 18,
                              ),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      description,
                      style:
                          const TextStyle(fontSize: 17, color: Colors.white70),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

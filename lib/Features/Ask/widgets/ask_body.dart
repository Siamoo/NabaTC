import 'package:firebase1/Features/Ask/widgets/coustom_ask_text_field.dart';
import 'package:firebase1/Features/Ask/widgets/custom_ask_image.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskBody extends StatelessWidget {
  const AskBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Ask",
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: kOrangeColor),
                ),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: kOrangeColor),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomAskImage(screenWidth: screenWidth),
                    const SizedBox(
                      height: 60,
                    ),
                    const CustomAskTextField(
                        title: 'Plant name', icon: Icon(Icons.eco)),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomAskTextField(
                        title: 'You\'r ask', icon: Icon(Icons.question_answer)),
                        const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showSnackBarHelpers(context, 'You\'r ask uploded');
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor),
                      child: const Text(
                        'Send',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        );
  }
}

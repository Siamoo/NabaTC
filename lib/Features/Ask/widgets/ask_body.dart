import 'package:firebase1/Features/Ask/widgets/coustom_ask_text_field.dart';
import 'package:firebase1/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase1/Features/Ask/widgets/custom_ask_image.dart';
import 'package:firebase1/constant.dart';

class AskBody extends StatefulWidget {
  const AskBody({super.key});

  @override
  State<AskBody> createState() => _AskBodyState();
}

class _AskBodyState extends State<AskBody> {
  final TextEditingController _plantNameController = TextEditingController();
  final TextEditingController _askController = TextEditingController();

  void _submitQuestion() {
    String plantName = _plantNameController.text.trim();
    String question = _askController.text.trim();

    if (plantName.isEmpty || question.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Missing Information'),
          content: Text('Please fill in all fields before submitting.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thank You!'),
        content: Text('Plant Name: $plantName\nYour Question: $question'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              Navigator.pop(context); 
            },
            child: const Text('Close'),
          )
        ],
      ),
    );

    // Send data to Firebase or your backend API here.
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(pageTilte: 'Ask'),
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
                  const SizedBox(height: 30),
                  CustomAskImage(screenWidth: screenWidth),
                  const SizedBox(height: 60),
                  CustomAskTextField(
                    title: 'Plant name',
                    icon: const Icon(Icons.eco),
                    controller: _plantNameController,
                  ),
                  const SizedBox(height: 16),
                  CustomAskTextField(
                    title: 'Your ask',
                    icon: const Icon(Icons.question_answer),
                    controller: _askController,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kWhiteColor,
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

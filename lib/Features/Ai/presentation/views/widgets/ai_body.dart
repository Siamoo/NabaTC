import 'dart:io';
import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_cubit.dart';
import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_state.dart';
import 'package:firebase1/Features/Ai/presentation/views/widgets/custom_ai_image.dart';
import 'package:firebase1/Features/Ai/presentation/views/widgets/custom_selected_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/treatment_page.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AiBody extends StatefulWidget {
  const AiBody({super.key});

  @override
  _AiBodyState createState() => _AiBodyState();
}

class _AiBodyState extends State<AiBody> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Ai Scan",
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kOrangeColor,
                ),
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: BlocBuilder<UploadCubit, UploadState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (image != null)
                    CustomSelectedImage(image: image)
                  else
                    const CustomAiImage(),

                  if (state is UploadInProgress)
                    const CircularProgressIndicator(),

                  if (state is UploadSuccess)
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '  prediction: ',
                                style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    color: kOrangeColor),),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '${formatDiseaseName(state.message)} .',
                                style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: kWhiteColor,
                                  ),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13),
                              child:  Text(
                                '  confidence: ',
                                style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    color: kOrangeColor),),
                              ),
                            ),
                            Text(
                              '${state.additionalInfo} %',
                              style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                  color: kWhiteColor), ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        if (state.message != 'healthy')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TreatmentPage(
                                        diseaseName: formatDiseaseName(state.message),
                                        image: image,
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: kWhiteColor,
                                  backgroundColor: kHomeIconsBakColor,
                                  textStyle: GoogleFonts.bangers(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ),
                                child: const Text('more info'),
                              ),
                            ],
                          ),
                      ],
                    ),

                  if (state is UploadFailure)
                    Text(
                      'Error: ${state.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => _showImageSourceDialog(context),
                        style: ElevatedButton.styleFrom(backgroundColor: kWhiteColor),
                        child: const Text(
                          'Select Image',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (image != null) {
                            const userId = "1234";
                            context.read<UploadCubit>().uploadImage(userId, image!);
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: kWhiteColor),
                        child: const Text(
                          'Upload Image',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
}

String formatDiseaseName(String name) {
  return name.replaceAll('_', ' ');
}

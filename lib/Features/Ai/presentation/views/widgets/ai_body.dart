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
  File? _image;
  String url = 'https://c80d-156-207-169-184.ngrok-free.app/api/predict';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Ai Chick",
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
      body: BlocBuilder<UploadCubit, UploadState>(builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_image != null)
                  CustomSelectedImage(image: _image)
                else
                  const CustomAiImage(),

                // Show loading or success/error state
                if (state is UploadInProgress)
                  const CircularProgressIndicator(),
                if (state is UploadSuccess)
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '  prediction: ',
                              style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                      color: kOrangeColor)),
                            ),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) * .6,
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
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              '  confidence: ',
                              style: GoogleFonts.bangers(
                                  textStyle: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                      color: kOrangeColor)),
                            ),
                          ),
                          Text(
                            '${state.additionalInfo} %',
                            style: GoogleFonts.bangers(
                                textStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                    color: kWhiteColor)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      if(state.message != 'healthy')
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
                                  ),
                                  settings: RouteSettings(
                                    arguments: formatDiseaseName(state.message),
                                  ),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: kWhiteColor, // text color
                              backgroundColor: kHomeIconsBakColor,
                              textStyle: GoogleFonts.bangers(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            child: Text('more info'),
                          )
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showImageSourceDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor),
                      child: const Text(
                        'Select Image',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ), // Upload button
                    ElevatedButton(
                      onPressed: () {
                        if (_image != null) {
                          String userId = "1234"; // Your userId
                          context.read<UploadCubit>().uploadImage(userId, url,
                              _image!); // Trigger the upload with selected image
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter api url',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.link),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        url = value;
                      });
                    },
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Show bottom sheet to choose camera or gallery
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

  // Handle image picking
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update image state
      });
    }
  }
}



String formatDiseaseName(String name) {
  return name.replaceAll('_', ' ');
}

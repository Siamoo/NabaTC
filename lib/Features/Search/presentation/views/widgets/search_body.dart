import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase1/Features/Treatment/presntation/views/treatment_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchDiseaseBody extends StatefulWidget {
  const SearchDiseaseBody({super.key});

  @override
  State<SearchDiseaseBody> createState() => _SearchDiseaseBodyState();
}

class _SearchDiseaseBodyState extends State<SearchDiseaseBody> {
  final TextEditingController _controller = TextEditingController();
  final List<String> allDiseases = [
    'Leaf Mold',
    'Target Spot',
    'Late blight',
    'Early blight',
    'Bacterial spot',
    'powdery mildew',
    'Septoria leaf spot',
    'Tomato mosaic virus',
    'Tomato Yellow Leaf Curl Virus',
    'Spider mites Two spotted spider mite',
  ];

  List<String> suggestions = [];

  void _updateSuggestions(String input) {
    setState(() {
      suggestions = allDiseases
          .where(
              (disease) => disease.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Note",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _updateSuggestions,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              cursorColor: kOrangeColor,
              decoration: InputDecoration(
                hintText: 'Search for a disease...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: kOrangeColor),
                filled: true,
                fillColor: kPrimaryColor.withAlpha((0.8 * 255).toInt()),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: kOrangeColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: kOrangeColor, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suggestions[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TreatmentPage(
                            diseaseName: suggestions[index],
                          ),
                          settings: RouteSettings(
                            arguments: suggestions[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

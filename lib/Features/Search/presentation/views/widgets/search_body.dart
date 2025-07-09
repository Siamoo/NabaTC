import 'package:firebase1/Features/Search/presentation/views/widgets/history_button.dart';
import 'package:firebase1/Features/Search/presentation/views/widgets/search_list_view_builder.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/utils/custom_app_bar_title.dart';
import 'package:flutter/material.dart';


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
          .where((disease) => disease.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(pageTilte: 'Search'),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HistoryButton(),
          ),
          SliverToBoxAdapter(
            child: Padding(
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
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.search, color: kOrangeColor),
                      filled: true,
                      fillColor: kPrimaryColor.withAlpha((0.8 * 255).toInt()),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: kOrangeColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: kOrangeColor, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SearchListViewBuilder(suggestions: suggestions),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

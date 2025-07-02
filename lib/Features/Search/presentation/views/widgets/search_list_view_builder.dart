
import 'package:firebase1/Features/Treatment/presntation/views/treatment_page.dart';
import 'package:flutter/material.dart';

class SearchListViewBuilder extends StatelessWidget {
  const SearchListViewBuilder({
    super.key,
    required this.suggestions,
  });

  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}

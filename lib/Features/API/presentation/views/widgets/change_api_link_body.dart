
// ✅ ChangeApiLinkBody.dart
import 'package:flutter/material.dart';
import 'package:firebase1/Features/API/presentation/manager/core/api_storage.dart';

class ChangeApiLinkBody extends StatefulWidget {
  const ChangeApiLinkBody({super.key});

  @override
  State<ChangeApiLinkBody> createState() => _ChangeApiLinkBodyState();
}

class _ChangeApiLinkBodyState extends State<ChangeApiLinkBody> {
  late TextEditingController _predictionController;
  late TextEditingController _treatmentController;

  @override
  void initState() {
    super.initState();
    _predictionController = TextEditingController();
    _treatmentController = TextEditingController();
    _loadStoredUrls();
  }

  Future<void> _loadStoredUrls() async {
    final predictionUrl = await ApiStorage.getPredictionUrl();
    final treatmentUrl = await ApiStorage.getTreatmentUrl();

    setState(() {
      _predictionController.text = predictionUrl ?? '';
      _treatmentController.text = treatmentUrl ?? '';
    });
  }

  Future<void> _saveUrls() async {
    await ApiStorage.savePredictionUrl(_predictionController.text.trim());
    await ApiStorage.saveTreatmentUrl(_treatmentController.text.trim());


  }

  @override
  void dispose() {
    _predictionController.dispose();
    _treatmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _predictionController,
              decoration: const InputDecoration(
                labelText: 'Prediction API URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.link),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _treatmentController,
              decoration: const InputDecoration(
                labelText: 'Treatment API URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.medical_services),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveUrls,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

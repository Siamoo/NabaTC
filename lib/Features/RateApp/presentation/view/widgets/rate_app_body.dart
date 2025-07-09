import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateAppBody extends StatefulWidget {
  const RateAppBody({super.key});

  @override
  State<RateAppBody> createState() => _RateAppBodyState();
}

class _RateAppBodyState extends State<RateAppBody> {
  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  void _submitRating() {
    String feedback = _feedbackController.text;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Thank You!'),
        content: Text(
            'You rated us $_rating stars\nYour feedback: ${feedback.isNotEmpty ? feedback : "No feedback"}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
            },
            child: const Text('Close'),
          )
        ],
      ),
    );

    // send feedback and rating to Firebase or your server here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'How would you rate our app?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Leave a feedback (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kWhiteColor),
              onPressed: _rating == 0 ? null : _submitRating,
              child: const Text(
                'send',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

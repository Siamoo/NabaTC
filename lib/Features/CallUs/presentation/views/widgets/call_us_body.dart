import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class CallUsBody extends StatelessWidget {
  const CallUsBody({super.key});

  void _callUs(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+201066036288');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch phone dialer')),
      );
    }
  }

  void _sendEmail(BuildContext context) async {
    final mailtoLink = Mailto(
      to: ['walidsyam.f@gmail.com'],
      subject: 'Need Help',
      body: 'Hi, I would like to ask about...',
    );
    final Uri emailUri = Uri.parse(mailtoLink.toString());

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open email app')),
      );
    }
  }

  void _openWhatsApp(BuildContext context) async {
    final phone = '201206611795';
    final message = Uri.encodeComponent("عمي وليد صيام");
    final url = Uri.parse("https://wa.me/$phone?text=$message");

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open WhatsApp.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Call Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _callUs(context),
            icon: Icon(Icons.phone,color: kWhiteColor,),
            label: Text('Call Us', style: TextStyle(color: kWhiteColor),),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _sendEmail(context),
            icon: Icon(Icons.email,color: kWhiteColor,),
            label: Text('Email Us', style: TextStyle(color: kWhiteColor),),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _openWhatsApp(context),
            icon: Icon(Icons.message,color: kWhiteColor,),
            label: Text('WhatsApp', style: TextStyle(color: kWhiteColor),),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}

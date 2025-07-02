
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHistoryButton extends StatelessWidget {
  const CustomHistoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('HistoryTreatmentPage');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              'asset/icons/history.svg',
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                kOrangewhiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            'History',
            style: TextStyle(
              color: kOrangewhiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

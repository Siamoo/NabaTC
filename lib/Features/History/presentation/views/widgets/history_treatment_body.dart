import 'package:firebase1/Features/History/data/models/historymodel.dart';
import 'package:firebase1/Features/History/presentation/views/widgets/custom_history_image.dart';
import 'package:firebase1/Features/Treatment/presntation/views/widgets/treatment_body.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/utils/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HistoryTreatmentBody extends StatelessWidget {
  const HistoryTreatmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final historyBox = Hive.box<Historymodel>('historyBox');

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(pageTilte: 'History'),
        iconTheme: const IconThemeData(color: kOrangeColor),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: ValueListenableBuilder(
        valueListenable: historyBox.listenable(),
        builder: (context, Box<Historymodel> box, _) {
          if (box.isEmpty) {
            return  Center(child: CustomHistoryImage() );
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final item = box.getAt(index);
                    return ListTile(
                      title: Text(item!.name),
                      subtitle: Text(DateFormat('yyyy/MM/dd     hh:mm a')
                          .format(item.date)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => box.deleteAt(index),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TreatmentBody(
                              diseaseName: item.name,
                              historyModel: item,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

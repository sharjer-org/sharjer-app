import 'package:flutter/material.dart';
import 'package:mojtama/viewmodels/plak_model.dart';
import 'package:mojtama/views/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class PlakInputWidget extends StatelessWidget {
  final String? Function(String?)? numValidator;
  final String? Function(String?)? farsiValidator;
  const PlakInputWidget({
    super.key,
    required this.numValidator,
    required this.farsiValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlakModel>(builder: (context, model, child) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor.withOpacity(0.15),
              ),
              child: Text(
                "پلاک خودرو را وارد کنید:",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomTextField(
                    controller: model.iranController,
                    label: "ایران",
                    helper: "مثال: ۱۶",
                    validator: numValidator,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomTextField(
                    controller: model.char3,
                    label: "سه رقم بعدی",
                    helper: "مثال: ۶۷۸",
                    validator: numValidator,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomTextField(
                    controller: model.char,
                    label: "حرف",
                    helper: "مثال: د",
                    validator: farsiValidator,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomTextField(
                    controller: model.lastNumber,
                    label: "عدد آخر",
                    helper: "مثال: ۵۲",
                    validator: numValidator,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:mojtama/models/payment_model.dart';
import 'package:mojtama/models/user_model.dart';
import 'package:mojtama/views/widgets/payment_status_table.dart';
import 'package:provider/provider.dart';

class UserChargeStatusScreen extends StatefulWidget {
  User user;
  UserChargeStatusScreen({
    super.key,
    required this.user,
  });

  @override
  State<UserChargeStatusScreen> createState() => _UserChargeStatusScreenState();
}

class _UserChargeStatusScreenState extends State<UserChargeStatusScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _loadResources());
  }

  @override
  Future<dynamic> _loadResources() async {
    var provider = Provider.of<PaymentModel>(context, listen: false);
    await provider.fetchChargeStatusOfAMember(widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("شارژ ${widget.user.name} ${widget.user.family}")),
      body: RefreshIndicator(
        onRefresh: () => _loadResources(),
        child: Consumer<PaymentModel>(builder: (context, model, child) {
          return SingleChildScrollView(
            child: Scrollbar(
              child: Column(
                mainAxisAlignment: model.chargeStatusOfAMember.isEmpty
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: model.chargeStatusOfAMember.isEmpty
                    ? [
                        Center(
                          child: Text(
                            "${widget.user.name} ${widget.user.family} شارژی را پرداخت نکرده است.",
                          ),
                        ),
                      ]
                    : List.generate(
                        model.chargeStatusOfAMember.length,
                        (index) {
                          return PaymentStatusTable(
                            year: "1444",
                            name: "${widget.user.name} ${widget.user.family}",
                            chargeStatusOfTheUser:
                                model.chargeStatusOfAMember[index],
                          );
                        },
                      ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

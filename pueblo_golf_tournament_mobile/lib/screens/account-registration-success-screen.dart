import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../widgets/common-widgets.dart';

class AccountRegistrationSuccessScreen extends StatefulWidget {
  const AccountRegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AccountRegistrationSuccessScreenState();
  }
}

class AccountRegistrationSuccessScreenState
    extends State<AccountRegistrationSuccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 100, 15, 0),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text(
              'Congratulations!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Image(
              image: const AssetImage('assets/registration-success.png'),
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: const Text(
                'You have successfully registered your account!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            BrandElevatedButton(
              onPressed: () => {},
              child: Text("Go to Login"),
              isFluid: true,
            )
          ]),
        ),
      ),
    );
  }
}

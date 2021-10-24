import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'call_tab_view_widgets.dart';

class CallTimings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CallTabVoiceFees(),
              Container(
                color: Colors.red,
                width: double.infinity,
                height: 200,
              ),
              Container(
                color: Colors.green,
                width: double.infinity,
                height: 200,
              ),
            ],
          ),
        ),
      );
}

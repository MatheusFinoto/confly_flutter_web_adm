import 'package:flutter/material.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.png')
            )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('C', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: GLOBAL.ORANGE),),
            Text('onfly', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: GLOBAL.GREY),),
          ],
        )
      ],
    );
  }
}

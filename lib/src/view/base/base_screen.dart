import 'package:flutter/material.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // drawer: size.width < 500 ? Drawer() : null,
      // appBar: size.width < 500 ? AppBar(elevation: 0,) : null,
      body: Row(
        children: [
          size.width < 480 ? Container() :
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Container(
              width: 200,
              child: Menu(),
            ),
          ),
          Expanded(
            child: Scaffold(
              drawer: size.width < 480 ? Drawer(child: Menu(),) : null,
              appBar: size.width < 480 ? AppBar(elevation: 0,) : null,
            ),
          )
        ],
      ),
    );
  }

  Widget Menu(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),)
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
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
          ),
        ),
        Container(width: double.infinity, height: 0.1, color: Colors.grey[200],)

      ],
    );
  }
}

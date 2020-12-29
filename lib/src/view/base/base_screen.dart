import 'package:confly_web_adm/src/components/custon_divider.dart';
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
            elevation: 5,
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
        CustonDivider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.fvcp6-1.fna.fbcdn.net/v/t1.0-9/132323826_3465168233536838_4705598638822315436_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGrpcmcd9hVNNrVqo1G797_8r6GOXzEweHyvoY5fMTB4V6pVpV5GOQmR9cnfvvmPwzft3oXr9ibkqbeCwTr1KdK&_nc_ohc=fZg-luuPYzkAX-f1Tuf&_nc_ht=scontent.fvcp6-1.fna&oh=b72b0dace4717f4d08fcc3ae603dc1ff&oe=600F7F69'),
          ),
          title: Text('Matheus'),
          subtitle: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                maxRadius: 5,
              ),
              Text('Online', style: TextStyle(fontSize: 12),)
            ],
          ),
        ),
        CustonDivider(),
        Expanded(
          child: ListView(
            children: [
              myTile(Icons.dashboard_outlined, 'Dashboard'),
              myTile(Icons.people_alt_outlined, 'Funcionários'),
              myTile(Icons.business, 'Empresas'),
            ],
          ),
        ),
        CustonDivider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Cofigurações'),
          onTap: (){},
        )

      ],
    );
  }

  Widget myTile(IconData icondata, String title){
    return ListTile(
      leading: Icon(icondata),
      title: Text(title,),
      onTap: (){},
    );
  }
}

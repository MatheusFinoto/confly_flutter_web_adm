import 'package:auto_size_text/auto_size_text.dart';
import 'package:confly_web_adm/src/components/custon_divider.dart';
import 'package:confly_web_adm/src/stores/base_store.dart';
import 'package:flutter/material.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  //final BaseStore baseStore = GetIt.I<BaseStore>();
  final BaseStore baseStore = BaseStore();

  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
    reaction((_)=>baseStore.page, (page)=>pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          size.width < 480 ? Container() :
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Container(
              width: 250,
              child: Menu(),
            ),
          ),
          Expanded(
            child: Scaffold(
              drawer: size.width < 480 ? Drawer(child: Menu(),) : null,
              appBar: size.width < 480 ? AppBar(elevation: 0,) : null,
              body: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  baseTab(),
                  Text('FUNCIONARIOS'),
                  Text('EMPRESAS'),
                  Text('NOTIFICAÇOES'),
                ],
              ),
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
              SizedBox(width: 4,),
              Text('Online', style: TextStyle(fontSize: 12),)
            ],
          ),
        ),
        CustonDivider(),
        Expanded(
          child: ListView(
            children: [
              myTile(Icons.dashboard_outlined, 'Dashboard', 0),
              myTile(Icons.people_alt_outlined, 'Funcionários', 1),
              myTile(Icons.business_outlined, 'Empresas', 2),
              myTile(Icons.notifications_none_outlined, 'Notificações', 3),
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

  Widget myTile(IconData icondata, String title, int page){
    return Observer(
      builder: (_){
        return ListTile(
          leading: Icon(icondata, color: page == baseStore.page ? GLOBAL.ORANGE : Colors.black,),
          title: Text(title,),
          onTap: (){
            baseStore.setPage(page);
          },
        );
      },
    );
  }

  Widget baseTab(){
    return Container(
      margin: EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                //color: Colors.grey[300],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text('DASHBOARD',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 0.3, width: double.infinity, color: Colors.grey,),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: myCard('Empresas', '10', Colors.lightBlueAccent, Icons.business_outlined),
                  ),
                  Expanded(
                    child: myCard('Funcionários', '6', Colors.green[600], Icons.group_outlined),
                  ),
                  Expanded(
                    child: myCard('Lucros', 'R\$: 1,000,434.00', Colors.orange, Icons.attach_money_outlined),
                  ),
                  Expanded(
                    child: myCard('Caixa', '\$ 10,543', Colors.red, Icons.attach_money_outlined),
                  ),
                ],
              ),
            )

          ],

        ),
      ),
    );
  }

  Widget myCard(title, subtitle, color, icon){
    return Card(
        elevation: 5,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: AssetImage('assets/lines1.png'),
                fit: BoxFit.cover
            ),
          ),
          //padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ListTile(
                title: AutoSizeText(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                subtitle: AutoSizeText(subtitle,style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                trailing: Icon(icon, size: 40, color: Colors.black.withOpacity(0.3),),
              ),
              SizedBox(height: 20,),
            ],
          ),
        )
    );
  }
}

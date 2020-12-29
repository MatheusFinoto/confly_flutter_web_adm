import 'package:confly_web_adm/src/components/logo.dart';
import 'package:confly_web_adm/src/stores/login_store.dart';
import 'package:confly_web_adm/src/utils/helper.dart' as GLOBAL;
import 'package:confly_web_adm/src/view/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    reaction((_)=>loginStore.loginStatus, (v){
      if(v == 2){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BaseScreen(),));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepOrange,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(height: 40,),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Usúario'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      expands: false,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Senha'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Observer(
                  builder: (_){
                    return AnimatedContainer(
                      width: loginStore.loading ? 50 : 400,
                      height: 50,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: RaisedButton(
                        color: GLOBAL.ORANGE,
                        disabledColor: GLOBAL.ORANGE.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: loginStore.loading ? BorderRadius.circular(50) :BorderRadius.circular(10),
                        ),
                        child: loginStore.loading ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),) : Text('ENTRAR', style: TextStyle(color: Colors.white),),
                        onPressed: loginStore.validToLogin,
                      ),
                    );
                  },
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

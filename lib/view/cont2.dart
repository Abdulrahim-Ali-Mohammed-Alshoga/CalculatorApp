import 'package:flutter/material.dart';
class Cont2 extends StatelessWidget {
  var name,colo;

 Cont2(this.name);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width:double.infinity,
      color:Theme.of(context).brightness==Brightness.dark?Colors.black26: Colors.white10,
      child: Center(child: Text(name,style: TextStyle(fontSize: 24,color:Theme.of(context).brightness==Brightness.dark? Color(0xff80aaff):Colors.blue[700],fontWeight: FontWeight.w500),)),
    );
  }
}

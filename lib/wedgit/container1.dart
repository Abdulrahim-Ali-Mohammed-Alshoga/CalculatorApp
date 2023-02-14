import 'package:flutter/material.dart';
class Container1 extends StatefulWidget {
  String name;
  var size,check;

   Container1(this.name,this.size,[this.check=0]);

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: widget.size,

      child: widget.check==1?Container(
        decoration: BoxDecoration(color: Colors.blue.withOpacity(.4),borderRadius: BorderRadius.circular(4)),

        margin: EdgeInsets.only(right: 6,left: 6,top: 4),
        child: Center(
          child: Text(
           widget.name ,style: TextStyle(color: Colors.white,fontSize: 22),
          ),
        ),
      ): Center(
        child: Text(
          widget.name ,style: TextStyle(color: Colors.white,fontSize: 22),
        ),
      ),
    );
  }
}

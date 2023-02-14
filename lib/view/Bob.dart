import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/page_1.dart';
import 'package:untitled/wedgit/getx_liget.dart';
import 'package:untitled/wedgit/history.dart';

enum Menu{
  itemOne,itemTwo,itemThree,itemFour
}

class Bob extends StatefulWidget {
  Function(String) add2;
Bob({required this.add2});


  @override
  State<Bob> createState() => _BobState();

}

var box=Hive.box(Type_Lihgt);
int num=box.get("type",defaultValue:"Light")=="Light"?0:1;
//final Controller_type c = Get.put(Controller_type());
class _BobState extends State<Bob> {
  @override

  Widget build(BuildContext context) {
    return
      PopupMenuButton<Menu>(onSelected: (Menu i) async {
      if(i.name=="itemOne") {
        var date12="";
        date12=await Get.to( Historyy(),transition: Transition.upToDown);

       if(date12.isNotEmpty){
         print(date12);
         widget.add2(date12);
       }
//Get.to(Historyy());


          }
      else if(i.name=="itemTwo") {
        print("77777");
        showDialog<void>(
            context: context,
            builder: (BuildContext context)
        {

          return AlertDialog(
            title: Text("Choose theme"),
            actions: <Widget>[
              TextButton(
                child:  Text('Cancel',style: TextStyle(color:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue)),
                onPressed: () {  Get.back();

                },
              ),
              TextButton(
                child:  Text('Ok',style: TextStyle(color:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue)),
                onPressed: () {
                  if(num==0){
                    box.put("type","Light");
                    Get.changeTheme(ThemeData.light());
                  }
                  else{
                    box.put("type","Dark");
                    Get.changeTheme(ThemeData.dark());
                  }
                  Get.back();
                },
              ),
            ],
            contentPadding: EdgeInsets.only(right: 15),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RadioListTile<int>(activeColor: Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue
                      ,value: 0,title: Text('Light'), groupValue:num, onChanged:  (int ?value) {
                      setState(() {
                        num = value!;
                      } );
                    },),
                    RadioListTile<int>(activeColor: Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue,
                      title:Text("Dark") ,value: 1, groupValue:num, onChanged:  (int ?value) {

                      setState(() {
                        num = value!;
                      });
                    },),
                    RadioListTile<int>(activeColor:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue,
                      value: 2,title:Text('Set by Battery Saver') , groupValue:num, onChanged:  (int ?value) {
                      setState(() => num = value!);
                    },),
                  ]

                );
              },
            ),
          );

        });
      //   Get.defaultDialog(
      //     content: Column(
      //       children: [
      //         ListTile(title: Text('Light'),
      //           trailing: Radio<Typelight>(value:Typelight.light,
      //             activeColor: Colors.red,groupValue: gender, onChanged:
      //               (Typelight?val){
      //             setState((){gender=val;});
      //               },),
      //         ),
      //         ListTile(title: Text('Dark'),
      //           trailing: Radio<Typelight>(
      //             activeColor: Colors.red,
      //             value:Typelight.dark, groupValue: gender, onChanged:
      //               (Typelight?val){
      //             setState((){gender=val;});
      //           },),
      //         ),
      //         ListTile(
      //           title: Text('Set by Battery Saver'),
      //           trailing: Radio<Typelight>( activeColor: Colors.red,
      //             value:Typelight.system, groupValue: gender, onChanged:
      //               (Typelight?val){
      //                 setState((){
      //                  print("object");
      //                   gender=val;
      //                 });
      //
      //           },),
      //         ),
      //       ],
      //     ),
      //     title: "Choose theme",
      //
      //
      //     radius: 10,
      //     textCancel: 'Cancel',
      //     buttonColor: Colors.white10,
      //     textConfirm: 'OK',
      //   );

      }
    },itemBuilder: (BuildContext context)=><PopupMenuEntry<Menu>>[
      const PopupMenuItem(child: Text("History"),value: Menu.itemOne,),
      const PopupMenuItem(child: Text("Choose theme"),value: Menu.itemTwo,),
      const PopupMenuItem(child: Text("Send feedback"),value: Menu.itemThree,),
      const PopupMenuItem(child: Text("Help"),value: Menu.itemFour,),
    ]);
  }
}


class menu {
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../main.dart';
import 'classhistory.dart';
import 'getx_liget.dart';
class Historyy extends StatefulWidget {
  const Historyy({Key? key}) : super(key: key);

  @override
  State<Historyy> createState() => _HistoryyState();
}
var box=Hive.box<History>(Hist);
//var list;

class _HistoryyState extends State<Historyy> {
  DateTime date=DateTime.now();
  RxController_type list=Get.put(RxController_type());
  getData() async {
//box.clear();
    setState(() {
      list.list =RxList(box.values.toList());
      list.list=RxList(list.list.reversed.toList());
     // list=l;
    });

    print(list.list[0].result);
    print(box.getAt(0)?.result);
    print(box.getAt(0)?.dateTime);

    print(5555);
  }

  List months =
  ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    print(months[date.month-1]);
    return Scaffold(
      appBar: AppBar(
        title: Text("History",style: TextStyle(color:Theme.of(context).brightness==Brightness.dark? Colors.white:Colors.blue[800])),
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(.4),
        //toolbarHeight: 50,

       backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.black.withOpacity(.1):Colors.white,
       foregroundColor: Theme.of(context).brightness==Brightness.dark?Colors.white70:Colors.blue[800],
        // leading: Text(
        //   'History',
        // ),
        actions: const <Widget>[bbob()],
      ),
      body: Obx(()=>Container(
        color:Theme.of(context).brightness==Brightness.dark?Colors.black12.withOpacity(.1):Colors.white10,

// width: 200,
// height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount:list.list.length,
          reverse: true,
          itemBuilder: (BuildContext context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80,bottom: 10,top: 10,
                  ),
                  child: Align(alignment: Alignment.topLeft,child: Text(list.list[index].dateTime.day==date.day?"Today":list.list[index].dateTime.day==date.day-1?
                  "Yesterday":months[list.list[index].dateTime.month-1]+" "+list.list[index].dateTime.day.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500, color:Theme.of(context).brightness==Brightness.dark? Color(0xff80aaff):Colors.blue[700]))),
                ),
                Padding(

                  padding: const EdgeInsets.only(bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment:list.list[index].operation.length<11||list.list[index].result.length<11? CrossAxisAlignment.end: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 50,right: 50),
                            child: GestureDetector(
                              onTap: (){
                                Get.back(result:list.list[index].result);
                              },
                              child: Text(list.list[index].result,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 40),
                             ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                             // list.num=RxString(list.list[index].result);
                              Get.back(result:list.list[index].operation);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: Align(
                                child: Text(list.list[index].operation,style: TextStyle(color: Colors.grey,fontSize: 35),
                             ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: index+1==1?0:1,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            );
          },),
      ))

      ,

    );
  }
}
enum Menu{
  item
}
class bbob extends StatefulWidget {
  const bbob({Key? key}) : super(key: key);

  @override
  State<bbob> createState() => _bbobState();
}

class _bbobState extends State<bbob> {
  @override
  RxController_type list=Get.find();
  Widget build(BuildContext context) {
return PopupMenuButton<Menu>(onSelected: (Menu i) async {
      if(i.name=="item") {
        //date12=await Get.to( Historyy(),transition: Transition.upToDown);
print(8888);

          box.clear();
          list.Clean();


      }

    },itemBuilder: (BuildContext context)=><PopupMenuEntry<Menu>>[
      const PopupMenuItem(child: Text("Clear"),value: Menu.item,),
    ]);
  }
}



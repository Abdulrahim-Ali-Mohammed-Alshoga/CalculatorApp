import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/Bob.dart';
import 'package:untitled/view/cont2.dart';
import 'package:untitled/wedgit/history.dart';

import '../wedgit/classhistory.dart';
import '../wedgit/container1.dart';
import '../wedgit/getx_liget.dart';
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var box=Hive.box<History>(Hist);
  DateTime date=DateTime.now();
var nmber=[],opsion=[],opsionchack=['%','*','/','+','-'];

equal(s){
  int n=_controller.selection.base.offset;
  //من اجل يغير حق المسح من حرف c الى الايقونة اما اذا كانت الايقونة قبل ان يدخل رقم فستظل الايقونة ولن يدخل ال if
  if(changeclear==true){
    setState((){changeclear=!changeclear;});
  }
  // التحقق من ان النص ليس فاضي
  if(n!=0)
  {
    //التحقق من ان الماشر عند اخر حرف
    if(_controller.text.length==_controller.selection.base.offset)
      {
        //التحقق من اخر حرف موجود في النص اذا عملية حسابية فسيقوم بحذف العملية ومن ثم ادخل العملية الجديدة امام اذا لم يكون اخر حرف موجود عملية فسيقوم بادخال العملية الحسابية
        if(opsionchack.contains(_controller.text.substring(n-1,n)))
        { check("");
        check(s);}
        else{
          check(s);
        }
      }
    //اذا لم يكن الماشر في اخر حرف فسيتم التحقق من ان الحرف الذي قبل وبعد الموشر ليس عملية حسابية فسيدخل التحقق ويضيف العملية الحاسبية ومن ثم القيام بالعملية الحسابية
    else if(!opsionchack.contains(_controller.text.substring(n,n+1))&&!opsionchack.contains(_controller.text.substring(n-1,n))) {
        check(s);
        checkequal();
      }
    //اذا لم يكن الماشر في اخر حرف فسيتم التحقق من ان الحرف الذي قبل الموشر عملية حسابية فسيدخل التحقق ويقوم بحذف العملية وادخال العملية الجديدة ومن ثم القيام بالعملية الحسابية
    else if(opsionchack.contains(_controller.text.substring(n-1,n))){
      //_controller.selection.base.offset+1;
      check("");
      check(s);
      checkequal();
    }
    //اذا لم يكن الماشر في اخر حرف فسيتم التحقق من ان الحرف الذي بعد الموشر عملية حسابية فسيدخل التحقق يقوم بتحريك الموشر الى قبل العملية ثم يقوم بحذفها وادخال العملية الجديدة ومن ثم القيام بالعملية الحسابية
    else{
      _controller.selection=TextSelection.collapsed(offset:_controller.selection.base.offset+1);
      check("");
      check(s);
      checkequal();
    }
    }

}
checkequal(){
  //من اجل يعمل حدث لكي يصغر حجم النص
  if(_controller.text.length>6&&_controller.text.length<10) {
    setState((){});
  }
  var start=0;
  //يقوم بحذف كل ما داخل لاستت الاشارات والارقام ويدخلها من جديد
  opsion.clear();
  nmber.clear();
  //ال loop من اجل نفصل الاشارات من عن الارقام وادخال كل واحد بحقة اللست
  for(var i=0;i<_controller.text.length;i++){
    if(_controller.text[i]=="+"||_controller.text[i]=="%"||_controller.text[i]=="*"||_controller.text[i]=="-"||_controller.text[i]=="/"){
      // print(_controller.text[i]);
      opsion.add(_controller.text[i]);
      nmber.add(_controller.text.substring(start,i));
     // if(i+1!=_controller.text.length){
     //   nmber.add(_controller.text.substring(i+1,_controller.text.length));
     // }
      //هذا المتغير من اجل تحديد المكان الذي سيبدا فيه الرقم لكي ندخاة في لاستت الارقام و + 1 لان هذا مكان الاشارة فنبدا من العنصر الذي بعد الاشارة
      start=i+1;
    }
  }
  // if
   //print(_controller.text.substring(_controller.text.length-1,_controller.text.length));
  //هذا الشرط من اجل ادخل اخر مجموعة ارقام متواجدة بعد العملية الحسابية الخيرة لان الشرط الذي فوق هذا يدخل الى اخر عملية والارقام الذي قبل العملية الخيرة فقط
   if(opsion.isNotEmpty&&start<_controller.text.length)
     {
       nmber.add(_controller.text.substring(start,_controller.text.length));
     }
   //هذا الشرط من اجل يتحقق من لست الارقام اذا اكثر من واحدة يدخل يقوم بالعملية اما اذا كان اقل فيعمل مسح لحاوية النص الثانية مثال 9*9 ما يدخل الشرط عند حذف * يدخل الشرط ويحذف محتوى الحاوية 2
  if(nmber.length<=1) {
    _controller1.clear();
  }
 else{ fff();}




}
fff(){
  double sum=0;
var changenmber="-1";
var changeopsion;
  if(nmber.length>1){
    for(var i=0;i<opsion.length;i++){

      //هذا الشرط opsion.isNotEmpty من اجل لا يطلع خطى اذا بداء بعملية حسابة
      //هذا الشرط nmber.length>1 من اذا كان اخر مافي النص عملية حسابية فيتوقف على ما قبلها واخر عملية تنظر الرقم الذي يذخل بعدها
      // if(nmber.length==1){
      //   break;
      //   break;
      //   break;
      // }
      if(opsion.isNotEmpty&&nmber.length>1){
        // عملنا try بسبب حدوث خطاء وذالك عند ما تكون الاشارة + او - فيدخل يتحقق اذا كانت هي اخر فيحدث خطاء بسبب i+1 gu]l ,[,]m
          try{
  if((opsion[i]=='+'||opsion[i]=='-')&&nmber.length>opsion.length)
{
  if((opsion[i+1]=='*'||opsion[i+1]=='/'||opsion[i+1]=='%')){
    changeopsion=opsion[i+1];
    opsion[i+1]=opsion[i];
    opsion[i]=changeopsion;
    changenmber=nmber[i];
    nmber.removeAt(0);
  }
}}
          catch(e){
            print("object");
          }

        switch (opsion[i]){
          case '+':
            sum=double.parse(nmber[i])+double.parse(nmber[i+1]);
            break;
          case '-':
            sum=double.parse(nmber[i])-double.parse(nmber[i+1]);
            break;
          case '%':
            sum=double.parse(nmber[i])*double.parse(nmber[i+1])/100;
            break;
          case '*':
            sum=double.parse(nmber[i])*double.parse(nmber[i+1]);
            break;
          case '/':
            //هذا الشرط من اجل اذا كان بعد عملية القسمة 0 يطلع خطى
            if(double.parse(nmber[i+1])==0){
              _controller1.clear();
              cantdivdeby=true;
              return;
            }
            // اذا كان بعد القسمة اي رقم يقوم بقسمته طبيعي وخلينا cantdivdeby سالب من اجل اذا انقسم على صفر وبعده رقم يقسم طبيعي مثل 8/056
            else{ sum=double.parse(nmber[i])/double.parse(nmber[i+1]);cantdivdeby=false;}

            break;
          case '=':
            _controller=_controller1;
            _controller1.clear();
            break;
        }
//حذف العلامة الذي تم تنفيذها
        opsion.removeAt(i);
        //نتيجت الذي وقعت بين الرقمين ندخلها في nmber[i] ونجعله toString() لان اللسته كلها نص
        nmber[i]=sum.toString();
        //حذف الرقم الثاني الذي تم تنفيذها
        nmber.removeAt(i+1);
        //ننقص العداد رقم لانهو نقصت سبب تنفيذ احدا العمليات
        i=i-1;
       if(changenmber!="-1"){

         nmber.insert(0, changenmber);changenmber="-1";}
//هذا المتغير مع الشرط من اجل التاكد اذا كان باقي رقم بعد الفاصلة يعني عشري فيخلية يطبع المتغير نوع دبل واذا كان من دون فيخلية int
        int sum1=sum.toInt();
        if(sum==sum1) {
          _controller1.text=sum1.toString();
        }
        else
        {
          //عملنا هذا السطر من اجل التقريب الى اقرب 6 ارقم بعد العلامة العشرية وساويناها ب sum من اجل اذا كان اخر ارقام التقريب 0 يقوم بحذفهن
          sum=double.parse(sum.toStringAsFixed(6));
          _controller1.text=sum.toString();
        }
      }
    }}}
check(String s){
  // هذا الشرط من اجل اذا تم القسمة وحمرة الشاشة تيرجع الى شكلها الطبيعي اذا قام بالضغط على اي عملية او رقم
  if(cantdivdeby==true)
    {setState((){
     cantdivdeby0=false;
     cantdivdeby=false;
    });}
  if(_controller.selection.base.offset==-1||_controller.selection.base.offset==_controller.text.length){
    s==''&&_controller.text.isNotEmpty&&_controller.selection.base.offset!=0?_controller.text=_controller.text.substring(0,_controller.text.length-1):_controller.text+=s;
    _controller.selection=TextSelection.collapsed(offset: _controller.text.length);
  }
  else {
    var nmb=_controller.selection.base.offset;
    _controller.text=_controller.text.substring(0,s==''&&_controller.text.isNotEmpty&&_controller.selection.base.offset!=0?_controller.selection.base.offset-1:_controller.selection.base.offset)+s+_controller.text.substring(_controller.selection.base.offset,_controller.text.length);
    _controller.selection=TextSelection.collapsed(offset:s==''&&nmb==0?0:s==''?nmb-1: nmb+1);

  }
  //هذا الشرط من اجل اذا هي عملية حسابية ما يقوم بها الا عند دخول رقم بعدها
  if(!opsionchack.contains(s)){
  checkequal();
  }
  }
//المتغير change من اجل تغيير النص الموجود في زر RAD عند الضغط علية الى DEG
// المتغير change1 من اجل تغيير نص الازرار عند الضغط على زر INVظظ
// المتغير cantdivdeby0 من اجل تغيير لون النص عند القسمة على 0
// المتغير cantdivdeby من اجل لا يتم التغيير الى اللون الاحمر الى لما ةنقوم بالضغط على علامة المساواة فيدخل الى else لمجودة تحت في زر المساواة وتتحول cantdivdeby0 الى true يتغير لون النص الى الاحمر
var change1=false,change=false,changeclear=false,cantdivdeby0=false,cantdivdeby=false;
TextEditingController _controller=new TextEditingController();
TextEditingController _controller1=new TextEditingController();
//المتغيرين h & w من الج تحديد طول وعرض الشاشة
double h=0;
double w=0;
//هذه الدالة من اجل ينم استدعاها من صفحة bob وعمل حدث للشاشة وتحدث المحتوى عند اختيار قيمة من صفحة history
  add(String num){
    //ذا الشرط من اجل اذا كان زر التنظيف يعمل يعني كان في حالة clear اي الرز يكون مكتوب فوقة C يحولة الى حذف عنصر فقط امام اذا كان حذف عنصر فيضل مثل ما هو
    if( changeclear) {
      changeclear = !changeclear;
    }
    //القيمة num هي القيمة التي تاتي من صفحة history الى bob من ثم الى هذه الدالة
    setState((){
      num=_controller.text+num;
      //حفظ الارقام الموجودة في الشاشة مع الذي من history سوى كانت عملية حسابية او نتيجة من ثم قمنا بتنظيف الشاشة من اجل لا يتكرر الرقم الموجود في الشاشة مسبقا
      _controller.clear();
      check(num);
      //من ثم قمنا بدخل كل ما هو موجود في num دالة check من اجل تحسب حتى تقوم بالعملية الحسابية اذا وجدات
    //  _controller.text=;
    });
  }
  //من اجل طول ال appbar يتغير حسب اذا الشاشة مستقيمة او على احد الجنبين
var mode=false;
// @override
//   void initState() {
//   // TODO: implement initState
//   super.initState();
//   SystemChannels.textInput.invokeListMethod('TextInput.hide');
// }
  @override
  Widget build(BuildContext context) {
    //هذا الشرط من اجل ال appbar يتغير على حسب اذا الشاشة مستقيمة او على احد الجنبين
if(MediaQuery.of(context).orientation==Orientation.portrait){
  mode=false;
}
else{
  mode=true;
}
    w=MediaQuery.of(context).size.width;
  h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        //اذا كانت الشاشة مستقيمة فحجم h*.05 م اذا كانت على احد لجانبين فحجمها h*.08
        preferredSize: Size(w,mode?h*.08: h*.05),
        child: AppBar(
elevation: 0,
          //ذا الثلاث الارقام التي في appbar لذي بتدخلنا ال history
          actions:  <Widget>[Bob(add2: add,)],
          backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.black12.withOpacity(.1):Colors.white10,
          shadowColor: Theme.of(context).brightness==Brightness.dark?Colors.black12.withOpacity(.1):Colors.white10,
          foregroundColor:Theme.of(context).brightness==Brightness.dark?Colors.white70:Colors.black45,

          leading: GestureDetector(onTap: (){
            setState((){ change=!change;});
          },
            child: Center(
              child: Text(
                change==false? "RAD":"DEG",
                style:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Theme.of(context).brightness==Brightness.dark?Colors.white70:Colors.black45),
              ),
            ),
          ),
        ),
      ),
      body:OrientationBuilder(
        // _هذا ال widget من اجل اذا كانت الشاشة مستقمية تاخذ _portraitMode اما اذا كانت باحد الجانبين تاخذ landscapeMode_
        builder: (context,orientation){
          if(orientation==Orientation.portrait){
            return _portraitMode();
          }
          else{
            return _landscapeMode();
          }
        }
      )

    );

  }

  Widget _portraitMode(){
    return
     SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Container(
        width: w,
        //حجم appbar 56
        //height: h-(AppBar().preferredSize.height+(60-h*.05)),
        child: Column(
          children: [
            // Container(
            //   height: 20,
            //   child: Row(children: [
            //    IconButton(onPressed: (){const Bob();}, icon: Icon(Icons.add_box_outlined))
            //
            //    , GestureDetector(onTap: (){
            //       setState((){ change=!change;});
            //     },
            //       child: Center(
            //         child: Text(
            //           change==false? "RAD":"DEG",
            //           style:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Theme.of(context).brightness==Brightness.dark?Colors.white70:Colors.black45),
            //         ),
            //       ),
            //     ),
            //   ]),
            // ),
            Container(
            //  height: h*.227,
              color:Theme.of(context).brightness==Brightness.dark?Colors.black12.withOpacity(.1):Colors.white10,
              child: Column(
                children: [
                  Padding(

                    padding:  EdgeInsets.only(right: w*.125,top: h*.01),
                    child: SizedBox(
                      height: h*.110 ,
                      child: TextFormField(
                        maxLines: 1,
                        controller: _controller,

                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9.,/*-+,]'))],
                        cursorColor:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue,
                        autofocus: true,
// showCursor: true,
// readOnly: true,
                        keyboardType: TextInputType.none,
                        // onFieldSubmitted: (s){
                        //   FocusScope.of(context).unfocus();
                        //
                        // },
                        // decoration: const InputDecoration(
                        //     focusedBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           width: 0,
                        //           color: Colors.white,
                        //         )
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //         borderSide: BorderSide(
                        //           width: 0,
                        //           color: Colors.white,
                        //         )
                        //     )
                        // ),
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          //  fillColor: Colors.orange, filled: true,
                          border:InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        // هذا الشرط من اجل يتم تصغير نص العملية كل ما كثرة الارقم
                        style: TextStyle(fontSize:_controller.text.length<=6? h*.075:_controller.text.length<=8?
                        h*.068: h*.060,fontWeight: FontWeight.w500,color:cantdivdeby0? Colors.red:Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
                      ),
                      ),
                    ),
                  ),Padding(
                    padding:  EdgeInsets.only(right: w*.125,top:h*.02),
                    child: SizedBox(
                      height: h*.105,
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        controller: _controller1,
                        readOnly: true,
                        style: TextStyle(fontSize: h*.05,fontWeight: FontWeight.w400,color:cantdivdeby0? Colors.red:Colors.grey),
                        decoration: const InputDecoration(
                          border:InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ), GestureDetector(
                    onPanUpdate: (n){
                      if(n.delta.dy<100){
                      }
                    },
                    // onTap: (){
                    //   Get.to(const Historyy(),transition: Transition.downToUp);
                    // },
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 6,right:w*.469,left: w*.469),
                      child: Container(
                        height: 3.5,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color:Theme.of(context).brightness==Brightness.dark? Colors.white.withOpacity(.8): Colors.grey.withOpacity(.5)),

                      ),
                    ),
                  ),
                ],
              ),
            ),



            Container(
              //"sin-1 "
              height: h*.25,
              color: Colors.blue[800],
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              setState((){
                                change1=!change1;
                              });
                            },
                            child: Container1("INV",w/5,change1==true?1:0)),
                        GestureDetector(onTap: (){setState((){change=!change;});},child: Container1(change==false? "RAD":"DEG",w/5)),
                        Container1(change1==false?"sin":"sin-1",w/5),
                        Container1(change1==false?"cos":"cos-1",w/5),
                        Container1(change1==false?"tan":"tan-1",w/5),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){equal('%');},child: Container1("%",w/5)),
                        Container1(change1==false?"ln":"ex",w/5),
                        Container1(change1==false?"log":"10x",w/5),
                        Container1(change1==false?"√":"x2",w/5),
                        Container1("^",w/5),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container1("π",w/5),
                        Container1("e",w/5),
                        Container1("(",w/5),
                        Container1(")",w/5),
                        Container1("!",w/5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 10,
                    child: Row(
                      children: [

                        Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("7"),
                              Cont("4"),
                              Cont("1"),
                              Cont("0"),
                            ],
                          ),
                        ),
                        Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("8"),
                              Cont("5"),
                              Cont("2"),
                              Cont("."),
                            ],
                          ),
                        ),
                        Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("9"),
                              Cont("6"),
                              Cont("3"),
                              Cont(""),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(width: 1,decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.4)
                  )),
                  Expanded(flex: 6,
                    child: Row(
                      children: [
                        Expanded(flex: 1,
                            child: Column(
                              children: [
                                Expanded(flex: 1,child: GestureDetector(onTap: (){equal('/');},child: Cont2("/"))),
                                Expanded(flex: 1,child: GestureDetector(onTap: (){equal('*');},child: Cont2("*"))),
                                Expanded(flex: 1,child: GestureDetector(onTap: (){equal('-');},child: Cont2("-"))),
                                Expanded(flex: 1,child: GestureDetector(onTap: (){equal('+');},child: Cont2("+"))),
                              ],
                            )
                        ),
                        Expanded(flex: 1,
                            child: Column(
                              children: [

                                Expanded(flex: 1,child: GestureDetector(
                                  // الضغط المطول يقوم بتنظيف كل من النص العلوي والسفلي واذا انقسمت العملية الذي قبلة على صفر فبعد الاستخدام يرد الارقام الى الالون العادي وليس الاحمر
                                    onLongPress:(){_controller.clear();_controller1.clear();cantdivdeby0=false;cantdivdeby=false;setState((){});}
                                    // الضغط وحذف عنصر واحد بحذف رقم او عملية واحده من النص العلوي بكل ضغطة ويتاكد من النص اذا صغر حجمة عند المسح يردة الى طبيعتة
                                    ,onTap: (){check("");
                                if(_controller.text.length>5&&_controller.text.length<=9) {
                                  //من اجل يعمل حدث لكي يكبر حجم النص
                                  setState((){});
                                }} ,child: Container(color:Theme.of(context).brightness==Brightness.dark? Colors.black26: Colors.white10,height: double.infinity,width:double.infinity ,child: changeclear==false? Icon(Icons.exit_to_app_rounded,color:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff): Colors.blue[800],)
                                    :GestureDetector(onTap: (){_controller.clear();setState((){changeclear=!changeclear;});},child: Cont2("C"))))),
                                Cont(""),
                                Cont(""),
                                //الشرط الاول ننقل النص حق حاوية النص الثانية الى الاول الشرط الثاني نحرك الماشر الى اخر عنصر في الحاوية الثانية والشرط الثالث نفرغ الحاوية الثانية
                                Expanded(flex: 1,child: GestureDetector(onTap: (){
                                  if(!cantdivdeby){if(_controller1.text.isNotEmpty) {
                                    // history.dateTime=date;
                                    // history.result=_controller.text;
                                    // history.operation=_controller1.text;
                                    //من اجل اذا كان اخر حاجه في النص عملية حسابية يقوم بحذفها قبل ما يدخلها التخزين
                                    if(opsionchack.contains(_controller.text.substring(_controller.text.length-1,_controller.text.length))){
                                      check("");
                                    }
                                    var h=History(date,_controller.text,_controller1.text);
                                    box.add(h);
                                    _controller.text =
                                        _controller1.text;
                                    _controller.selection =
                                        TextSelection.collapsed(
                                            offset: _controller
                                                .text.length);
                                    setState((){
                                      changeclear=!changeclear;
                                    });
                                    _controller1.clear();

                                  }}
                                  else{
                                    _controller1.text="Can't divide by 0";
                                    cantdivdeby0=true;
                                    setState((){

                                    });
                                  }

                                },child: Cont2("="))),
                              ],
                            )
                        ),


                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _landscapeMode(){
    return
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
           width: w,
          // height: h-(kToolbarHeight)+17,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: w*.1),
                child: TextFormField(
                  maxLines: 1,

                  controller: _controller,

                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9.,/*-+,]'))],
                  cursorColor:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff) : Colors.blue,
                  autofocus: true,
// showCursor: true,
// readOnly: true,
                  keyboardType: TextInputType.none,
                  // onFieldSubmitted: (s){
                  //   FocusScope.of(context).unfocus();
                  //
                  // },
                  // decoration: const InputDecoration(
                  //     focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 0,
                  //           color: Colors.white,
                  //         )
                  //     ),
                  //     enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 0,
                  //           color: Colors.white,
                  //         )
                  //     )
                  // ),
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                    //  fillColor: Colors.orange, filled: true,
                    border:InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize:_controller.text.length<=6? h*.075:_controller.text.length<=8?
                  h*.068: h*.060,fontWeight: FontWeight.w500,color:cantdivdeby0? Colors.red:Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,),
                ),
              ),Padding(
                padding:  EdgeInsets.only(right: w*.1),
                child: TextFormField(
                  textAlign: TextAlign.end,
                  controller: _controller1,
                  readOnly: true,
                  style: TextStyle(fontSize: h*.05,fontWeight: FontWeight.w400,color:cantdivdeby0? Colors.red:Colors.grey),
                  decoration: const InputDecoration(
                    border:InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                  height: 1,decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.4)
                ,
              )),
              Expanded(
                child: Container(
                  color: Colors.grey.withOpacity(.1),
                  child: Row(
                    children: [
                      Expanded(flex: 5,
                        child: Row(
                          children: [

                          Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("7"),
                              Cont("4"),
                              Cont("1"),
                              Cont("0"),
                            ],
                          ),
                        ),
                        Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("8"),
                              Cont("5"),
                              Cont("2"),
                              Cont("."),
                            ],
                          ),
                        ),
                        Expanded(flex: 1,
                          child: Column(
                            children: [
                              Cont("9"),
                              Cont("6"),
                              Cont("3"),
                              Cont(""),
                            ],
                          ),)

                          ],
                        ),
                      ),
                      Container(width: 1,decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4)
                      )),
                      Expanded(flex: 3,
                        child: Row(
                          children: [
                            Expanded(flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(flex: 1,child: GestureDetector(onTap: (){equal('/');},child: Cont2("/"))),
                                    Expanded(flex: 1,child: GestureDetector(onTap: (){equal('*');},child: Cont2("*"))),
                                    Expanded(flex: 1,child: GestureDetector(onTap: (){equal('-');},child: Cont2("-"))),
                                    Expanded(flex: 1,child: GestureDetector(onTap: (){equal('+');},child: Cont2("+"))),
                                  ],
                                )
                            ),
                            Expanded(flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(flex: 1,child: GestureDetector(onLongPress:(){_controller.clear();_controller1.clear();cantdivdeby0=false;
                                    cantdivdeby=false;setState((){});},onTap: (){check("");
                                    if(_controller.text.length>5&&_controller.text.length<=9) {
                                      //من اجل يعمل حدث لكي يكبر حجم النص
                                      setState((){});
                                    }} ,child: Container(color:Theme.of(context).brightness==Brightness.dark? Colors.black26: Colors.white10,height: double.infinity,width:double.infinity ,child: changeclear==false? Icon(Icons.exit_to_app_rounded,color:Theme.of(context).brightness==Brightness.dark?Color(0xff80aaff): Colors.blue[800],)
                                        :GestureDetector(onTap: (){_controller.clear();setState((){changeclear=!changeclear;});},child: Cont2("C"))))),
                                    Cont(""),
                                    Cont(""),
                                    //الشرط الاول ننقل النص حق حاوية النص الثانية الى الاول الشرط الثاني نحرك الماشر الى اخر عنصر في الحاوية الثانية والشرط الثالث نفرغ الحاوية الثانية
                                    Expanded(flex: 1,child: GestureDetector(onTap: (){
                                      if(!cantdivdeby){if(_controller1.text.isNotEmpty) {
                                        // history.dateTime=date;
                                        // history.result=_controller.text;
                                        // history.operation=_controller1.text;
                                        if(opsionchack.contains(_controller.text.substring(_controller.text.length-1,_controller.text.length))){
                                         check("");
                                        }
                                        var h=History(date,_controller.text,_controller1.text);
                                        box.add(h);
                                        _controller.text =
                                            _controller1.text;
                                        _controller.selection =
                                            TextSelection.collapsed(
                                                offset: _controller
                                                    .text.length);
                                        setState((){
                                          changeclear=!changeclear;
                                        });
                                        _controller1.clear();

                                      }}
                                      else{
                                        _controller1.text="Can't divide by 0";
                                        cantdivdeby0=!cantdivdeby0;
                                        setState((){

                                        });
                                      }

                                    },child: Cont2("="))),
                                  ],
                                )
                            ),

                          ],
                        ),

                      ) ,
                      Expanded(
                        flex: 5,
                        child: Container(
                          //"sin-1 "
                          color: Colors.blue[700],
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(flex: 1,
                                      child: GestureDetector(
                                          onTap: (){
                                            setState((){
                                              change1=!change1;
                                            });
                                          },
                                          child: Container1("INV",h/5,change1==true?1:0)),
                                    ),
                                    Expanded(flex: 1,child:Container1(change1==false?"sin":"sin-1",h/5)),
                                    Expanded(flex: 1,child:Container1(change1==false?"ln":"ex",h/5)),
                                    Expanded(flex: 1,child:Container1("π",h/5)),
                                    Expanded(flex: 1,child:Container1("(",h/5)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(flex: 1,child:GestureDetector(onTap: (){setState((){change=!change;});},child: Container1(change==false? "RAD":"DEG",h/5))),
                                    Expanded(flex: 1,child:Container1(change1==false?"cos":"cos-1",h/5)),
                                    Expanded(flex: 1,child:Container1(change1==false?"log":"10x",h/5)),
                                    Expanded(flex: 1,child:Container1("e",h/5)),
                                    Expanded(flex: 1,child:Container1(")",h/5)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(flex: 1,child:GestureDetector(onTap: (){equal('%');},child: Container1("%",h/5))),
                                    Expanded(flex: 1,child: Container1(change1==false?"tan":"tan-1",h/5)),
                                    Expanded(flex: 1,child: Container1(change1==false?"√":"x2",h/5)),
                                    Expanded(flex: 1,child: Container1("^",h/5)),
                                    Expanded(flex: 1,child: Container1("!",h/5)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
  //ال Widget المستخمة في الارقم
  Widget Cont(String name,[int colo=0]){
    return
      Expanded(
        flex: 1,
        child: GestureDetector(

          onTap: (){
//من اجل يحول التنظيف من حرف C الى رمز حذف العنصر
            if(changeclear==true){
             setState((){ _controller.clear();
             changeclear=false;});

            }
            check(name);
            },
          child: Container(
            height: double.infinity,
            width:double.infinity,
            color: Theme.of(context).brightness==Brightness.dark?Colors.black26:Colors.white10,
            child: Center(child: Text(name,style: TextStyle(fontSize: 25,color:Theme.of(context).brightness==Brightness.dark? Colors.white:Colors.black,fontWeight: FontWeight.w500),)),
          ),
        ),
      )   ;
  }
}


import 'package:flutter/material.dart';
import 'package:flutterbmi1/Utils/GenderBoxToggleAble.dart';
import 'package:flutter/services.dart';
import 'package:flutterbmi1/Utils/HeightSelector.dart';
import 'package:flutterbmi1/Utils/IncrementalBox.dart';
import 'package:flutterbmi1/result.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      home: const BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final double horizontalPadding=20;
  final double verticalPadding = 20;

  final List genderSelected = [true,false];
  String gender ="Male";
  double age=20;
  double weight=60;
  double height=2.0;


  void GenderSelectChange(int index){
    setState((){
      if (index==0){
        genderSelected[0]=true;
        genderSelected[1]=false;
        gender="Male";
      }
      else{
          genderSelected[1]=true;
          genderSelected[0]=false;
          gender="Female";
      }

    });
  }

  void AgeSelectIncrement(int number){
    setState((){
      age+=number;
    });
  }
  void WeightSelectIncrement(int number){
    setState((){
      weight+=number;
    });
  }

  void changeHeight(double value){
      setState((){
        height=value;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GenderBox(height: MediaQuery.of(context).size.height/4, width: MediaQuery.of(context).size.width,gender: "Male", isSelected: genderSelected[0],onChanged: ()=>GenderSelectChange(0),CurrentGender: gender),
                 SizedBox(width: 20,),
                 GenderBox(height: MediaQuery.of(context).size.height/4, width: MediaQuery.of(context).size.width,gender: "Female", isSelected:genderSelected[1],onChanged: ()=>GenderSelectChange(1),CurrentGender: gender),
               ],
             ),
           ),
            Expanded(
                child:Opacity(
                  opacity: 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: horizontalPadding),
                    child: HeightSelector(gender: gender,height: height,changeHeight: changeHeight,)
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding,horizontal: horizontalPadding),
              child: Row(
                  children:[
                    AgeAndWeight(height: MediaQuery.of(context).size.height/5,Param: "Age (years)",ageOrWeight: age, width: MediaQuery.of(context).size.width,incrementFunction: AgeSelectIncrement,gender: gender,tag:"1"),
                    SizedBox(width: 20,),
                    AgeAndWeight(height: MediaQuery.of(context).size.height/5,Param:"Weight (Kg)",ageOrWeight: weight, width: MediaQuery.of(context).size.width, incrementFunction: WeightSelectIncrement,gender: gender,tag:"2")
                  ]
              )
            ),
            Container(
              height: MediaQuery.of(context).size.height/10,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: gender=="Male"?Colors.blue:Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                  )
                ),
                onPressed: (){
                  double BMI =  weight / ((height*30.48)/100* (height*30.48)/100 );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => displayBMI(bmi:BMI,gender:gender)));
                },
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

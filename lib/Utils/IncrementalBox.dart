import "package:flutter/material.dart";

class AgeAndWeight extends StatelessWidget {
  final double height;
  final double width;
  final String Param;
  final double ageOrWeight;
  void Function(int) incrementFunction;
  final String gender;
  final String tag;
  AgeAndWeight({Key? key, required this.height, required this.width,required this.incrementFunction, required this.Param, required this.ageOrWeight, required this.gender, required this.tag,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: 0.7,
        child:Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(24)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children: [
                Text(Param,style: TextStyle(color: Colors.grey[500]),),
                SizedBox(height: 10,),
                Text(ageOrWeight.toInt().toString(),style: TextStyle(color: Colors.white,fontSize: 35),),
                SizedBox(height: 10,),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child:FloatingActionButton(
                            heroTag: "decrement"+tag,
                            mini: true,
                            backgroundColor: Colors.grey[800],
                            splashColor: gender=="Male"?Colors.blue:Colors.red,
                            onPressed:()=> incrementFunction(-1),
                            child: Icon(Icons.exposure_minus_1),
                          )
                      ),
                      Expanded(
                          child: FloatingActionButton(
                            heroTag: "increment"+tag,
                            mini: true,
                            backgroundColor: Colors.grey[800],
                            splashColor: gender=="Male"?Colors.blue:Colors.red,
                            onPressed: ()=>incrementFunction(1),
                            child: Icon(Icons.plus_one),
                          )
                      )

                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

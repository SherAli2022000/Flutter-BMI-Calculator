import "package:flutter/material.dart";

class HeightSelector extends StatelessWidget {
  final double height;
  final String gender;
  void Function(double) changeHeight;
  HeightSelector({Key? key, required this.height, required this.gender,required this.changeHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(24)
      ),
      
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Height",style: TextStyle(color: Colors.white,fontSize: 24),),
            SizedBox(height: 40,),
            Text(height.toStringAsPrecision(2).toString() + " ft",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 45),),
            SizedBox(height: 20,),
            Expanded(
              flex: 2,
              child: Slider(
                value: height,
                max: 10.0,
                min: 2.0,
                activeColor: gender=="Male"?Colors.blue:Colors.red,
                inactiveColor: Colors.grey[700],
                thumbColor: gender=="Male"?Colors.blue:Colors.red,
                onChanged:(value)=>changeHeight(value)
              ),
            ),

          ],

        ),
      ),
    );
  }
}

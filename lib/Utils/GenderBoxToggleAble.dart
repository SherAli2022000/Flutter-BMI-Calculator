import "package:flutter/material.dart";
// import 'package:google_fonts/google_fonts.dart';


class GenderBox extends StatelessWidget {
  final double height;
  final double width;
  bool isSelected=false;
  void Function() onChanged;
  final String gender;
  final String CurrentGender;
  GenderBox({Key? key, required this.height, required this.width, required this.isSelected,required this.onChanged, required this.gender, required this.CurrentGender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: 0.7,
        child: Container(
          height: height,
          width: width,

          child: ElevatedButton(

            style:ElevatedButton.styleFrom(
              primary: isSelected ? Colors.grey[800]: Colors.grey[900],
              elevation: 3,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
              )

            ),
            onPressed: onChanged,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(gender=="Male"?Icons.male:Icons.female,size: height/2.5,color: gender=="Male" && CurrentGender=="Male"? Colors.blue : gender=="Female" && CurrentGender=="Female"?Colors.red:Colors.white,),
                  SizedBox(height: 10,),
                  Text(gender,style: TextStyle(fontStyle: FontStyle.italic),)
                  // Text(gender,style: TextStyle(color: isSelected==true? Colors.grey[100]:Colors.grey[500]),)
                ],
              ),
              
            )
          )
        ),
      ),
    );
  }
}

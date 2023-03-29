import 'package:flutter/material.dart';
import 'package:flutterbmi1/main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class displayBMI extends StatefulWidget {
  final double bmi;
  final String gender;

  const displayBMI({Key? key, required this.bmi, required this.gender}) : super(key: key);

  @override
  State<displayBMI> createState() => _displayBMIState();
}

class _displayBMIState extends State<displayBMI> {
  final double width=30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Container(
                    decoration: BoxDecoration(
                      color:Colors.grey[900]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: ElevatedButton(onPressed: (){
                            Navigator.pop(context,
                                MaterialPageRoute(builder: (context) => BMI()));
                          },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: widget.gender=="Male"?Colors.blue:Colors.red
                              ),
                              child:Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("Go Back")
                                ],
                              ) 
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Your BMI Score",style: TextStyle(color: Colors.white,fontSize: 30),),
                        SizedBox(height: 20,),
                        SfRadialGauge(
                              enableLoadingAnimation: true,
                              axes: <RadialAxis>[
                                RadialAxis(
                                    useRangeColorForAxis: true,
                                    canRotateLabels: true,
                                    canScaleToFit: true,

                                    labelOffset: 50,
                                    interval: 3,
                                    minimum: 10, maximum: 45, ranges: <GaugeRange>[
                                  GaugeRange(
                                      rangeOffset: 14,
                                      label: "UNDERWEIGHT",
                                      labelStyle: GaugeTextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13
                                      ),
                                      startValue: 0,
                                      endValue: 18.5,
                                      color: Colors.lightBlueAccent,
                                      startWidth: width,
                                      endWidth: width
                                  ),
                                  GaugeRange(
                                      rangeOffset: 14,
                                      label: "NORMAL",
                                      labelStyle: GaugeTextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13
                                      ),
                                      startValue: 18.6,
                                      endValue: 24.9,
                                      color: Colors.green,
                                      startWidth: width,
                                      endWidth: width),
                                  GaugeRange(
                                      rangeOffset: 14,
                                      label: "OVER-WEIGHT",
                                      labelStyle: GaugeTextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13
                                      ),
                                      startValue: 25,
                                      endValue: 29.9,
                                      color: Colors.yellow,
                                      startWidth: width,
                                      endWidth: width),
                                  GaugeRange(
                                      rangeOffset: 14,
                                      label: "Obese",
                                      labelStyle: GaugeTextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13
                                      ),
                                      startValue: 30,
                                      endValue: 35,
                                      color: Colors.orange,
                                      startWidth: width,
                                      endWidth: width),
                                  GaugeRange(
                                      rangeOffset: 14,

                                      label: "Extremely Obese",
                                      labelStyle: GaugeTextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13
                                      ),
                                      startValue: 35,
                                      endValue: 45,
                                      color: Colors.red,
                                      startWidth: width,
                                      endWidth: width)

                                ], pointers: <GaugePointer>[
                                  NeedlePointer(value: widget.bmi,needleColor: Colors.white,animationDuration: 3,)
                                ], annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      widget: Container(
                                          child: Text(widget.bmi.toStringAsFixed(2),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25, fontWeight: FontWeight.bold))),
                                      angle: 90,
                                      positionFactor: 0.5)
                                ]
                              )
                            ]
                        ),
                        SizedBox(height: 20,),
                        Text("You are",style: TextStyle(color: Colors.white,fontSize: 20),),
                        SizedBox(height: 20,),
                        Text(widget.bmi<18.5?"UnderWeight":widget.bmi<25?"Normal weight":widget.bmi<30?"Over_weight":widget.bmi<35?"Obese":"Extremely_Obese",style:TextStyle(color: widget.gender=="Male"?Colors.blue:Colors.red,fontSize: 30))
                      ],
                    ),
              )
            ),

        ),
    );
  }
}

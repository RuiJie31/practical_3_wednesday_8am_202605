import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String bmi;
  const Info({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index (BMI) Info'),
      ),
      body: Padding(padding: EdgeInsets.all(8), child: Center(
          child: Column(
          mainAxisAlignment: .center,
        children: [
          Text('Body Mass Index (BMI) is a value derived from the mass (weight) and height of a person.\n\n'
              'The BMI is defined as the body mass divided by the square of the body height, and is expressed the unit'
              'of kg/m\u00B2.'),
          Table(
            border: TableBorder.all(
              color: Colors.orangeAccent
            ),
            children: [
              TableRow(
                children:[
                  TableCell(
                    child: Text('BMI Value',textAlign: .center,style: TextStyle(fontWeight:FontWeight.bold),),
                  ),
                  TableCell(
                    child: Text('Classification',textAlign: .center,style: TextStyle(fontWeight:FontWeight.bold),),
                  ),
                ]
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text('Below 18.5',
                    textAlign: .center,),
                  ),
                  TableCell(
                    child: Text('Underweight',
                      textAlign: .center,),
                  ),
                ]
              ),
              TableRow(
                  children: [
                    TableCell(
                      child: Text('18.5 - 24.9',
                        textAlign: .center,),
                    ),
                    TableCell(
                      child: Text('Normal',
                        textAlign: .center,),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    TableCell(
                      child: Text('Above 25',
                        textAlign: .center,),
                    ),
                    TableCell(
                      child: Text('Overweight',
                        textAlign: .center,),
                    ),
                  ]
              ),
            ],
          ),
          bmi == ''? Text('Please enter your height and weight to get your BMI value')
              :Text('Your BMI value is: $bmi'),
          Expanded(child: SizedBox()),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Back'))
        ],
      ),
      ),),
    );
  }
}

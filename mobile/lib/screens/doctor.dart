import 'package:flutter/material.dart';
import 'package:flutter_mindmed_project/widgets/colors.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});
static const id = 'Doctor';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Color(0xffffffff),
          child:   Text('Doctor',style: TextStyle(color: primaryColor,fontSize: 24),)
        ),
    );
  }
}
import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(

      height: height/3,
      child: ListView.separated(scrollDirection: Axis.horizontal,itemCount: 1,itemBuilder: (context, index) {
        return SizedBox(
          width: width,
          child: const Center(child: CircularProgressIndicator(),),
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/ui/size.dart';

class PopularMovieUI extends StatefulWidget {
  const PopularMovieUI({Key? key,required this.state}) : super(key: key);
  final state;
  @override
  State<PopularMovieUI> createState() => _PopularMovieUIState();
}

class _PopularMovieUIState extends State<PopularMovieUI> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(

      height: height/3,
      child: ListView.separated(scrollDirection: Axis.horizontal,itemCount: widget.state.results.length,itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 5,),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kRadius),
                child: Image.network(
                  'https://www.themoviedb.org/t/p/original${widget.state.results[index].backdropPath}',width: width,),
              ),
            ),
            const SizedBox(height: 5,),
            Text(widget.state.results[index].title!,style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10,);
      },),
    );
  }
}

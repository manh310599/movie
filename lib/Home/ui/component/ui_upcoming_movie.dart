import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Home/blocs/bloc/upcoming_bloc/upcoming.dart';
import 'package:movie_app/Home/blocs/cubits/cubit/loadmovie_upcoming_cubit.dart';
import 'package:movie_app/Home/ui/component/video/upcoming_video.dart';

import '../../../common/ui/size.dart';

class UpComingMovie extends StatefulWidget {
  const UpComingMovie(
      {Key? key,
      required this.state,
      required this.height,
      required this.width})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final state;
  final double height;
  final double width;

  @override
  State<UpComingMovie> createState() => _UpComingMovieState();
}

class _UpComingMovieState extends State<UpComingMovie> {
  final UpComingMovieBloc upComingMovieBloc = UpComingMovieBloc();

  @override
  Widget build(BuildContext context) {
    final state = widget.state as LoadMovieSuccess;
    return SizedBox(
      height: widget.height / 3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.state.upComing.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius),
                  child: InkWell(
                    onTap: () {


                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            print(state.upComing[index].id!);
                            return BlocProvider(create: (context) {
                              final bloc = VideoComingCubit();
                              bloc.test(state.upComing[index].id!);
                              return bloc;
                            },child: const UpcomingVideo() ,);
                          },
                        ));
                      
                    },
                    child: Image.network(
                      'https://www.themoviedb.org/t/p/original${widget.state.upComing[index].backdropPath}',
                      width: widget.width,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.state.upComing[index].title!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}

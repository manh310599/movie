import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Home/blocs/bloc/upcoming_bloc/upcoming.dart';
import 'package:movie_app/common/ui/size.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../blocs/cubits/cubit/loadmovie_upcoming_cubit.dart';
import '../../../blocs/cubits/cubit/loadmovie_upcoming_state.dart';

class UpcomingVideo extends StatefulWidget {
  const UpcomingVideo({Key? key}) : super(key: key);

  @override
  State<UpcomingVideo> createState() => _UpcomingVideoState();
}

class _UpcomingVideoState extends State<UpcomingVideo> {
  int item = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoComingCubit, UpComingMovieStateCubit>(
      builder: (context, state) {
        if (state is LoadedUpComingVideo) {
          int tam = 0;
          final List<String> key = [];
          while (tam == state.results.length) {
            key.add(state.results[tam].key!);
            tam++;
          }
          return Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                          initialVideoId: state.results[index].key!,
                          flags: const YoutubePlayerFlags(autoPlay: false)),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.red,
                        handleColor: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(
                      height: kSpacing,
                    ),
                  ],
                );
              },
              itemCount: item,
            ),
            floatingActionButton: item < state.results.length ? MaterialButton(onPressed: () {
              setState(() {
                if(item < state.results.length) {
                  item++;
                }
              });
            }, child: const Icon(Icons.arrow_drop_down)):
            const SizedBox(),
          );
        } else if (state is LoadFailUpComingVideo) {
          return const Center(
            child: Text('Rất tiếc bộ phim này không có video'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

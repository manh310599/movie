import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/upcoming_video_model.dart';
import '../../../resource/upcoming_resource/coming_movie_reponsitory.dart';
import 'loadmovie_upcoming_state.dart';

class VideoComingCubit extends Cubit<UpComingMovieStateCubit>{
  VideoComingCubit():super(LoadingUpComingVideo());

  Future<void> test (int id)async{

    final movieVideo = await UpComingRepository().upComingVideoRepository(id);
    final List<ResultsVideo> fillerData = [];
    print(movieVideo.results);
    if (movieVideo.results!.isEmpty )
      {
        emit(LoadFailUpComingVideo());
      }
    else
    {
      for (int i = 0;i<movieVideo.results!.length;i++){
        print(movieVideo.results![i].key);
        if (movieVideo.results![i].key != null)
        {

          fillerData.add(movieVideo.results![i]);
        }

        if (i == movieVideo.results!.length -1){
          emit(LoadedUpComingVideo(fillerData));
        }
      }
    }


  }
}
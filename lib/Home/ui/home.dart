import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Home/blocs/bloc/upcoming_bloc/upcoming.dart';
import 'package:movie_app/Home/ui/component/ui_popular_movie.dart';
import 'package:movie_app/Home/ui/component/ui_upcoming_movie.dart';
import 'package:movie_app/common/ui/loading_data.dart';
import 'package:movie_app/common/ui/size.dart';
import 'package:movie_app/Home/blocs/bloc/top_rate_movie/top_rate.dart';
import 'package:movie_app/Home/blocs/bloc/popular_movie_bloc/popular_movie.dart';

import 'component/top_rate_movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<UpComingMovieBloc>().add(LoadMovie());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('TMDB'),centerTitle: true,),
      body: SingleChildScrollView(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UpComingMovieBloc>(
              create: (context) {
                final bloc = UpComingMovieBloc();
                bloc.add(LoadMovie());
                return bloc;
              },
            ),
            BlocProvider<TopRateMovieBloc>(create: (context) {
              final bloc = TopRateMovieBloc();
              bloc.add(LoadMovieTopRateMovie());
              return bloc;
            },),
            BlocProvider<PopularBloc>(create: (context) {
              final bloc = PopularBloc();
              bloc.add(LoadPopularMovie());
              return bloc;
            },)
          ],
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: kSpacing,),
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/soon.svg',height: 20,color: Colors.yellow,),
                      const SizedBox(width: kSpacing,),
                      const Text('Những bộ phim sắp được công chiếu',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const SizedBox(height: kSpacing,),
                BlocBuilder<UpComingMovieBloc, UpComingMovieState>(
                  builder: (context, state) {
                    
                    // return CarouselSlider(items: items, options: CarouselOptions(height: height/3));
                    if (state is LoadMovieSuccess) {
                      
                      return  UpComingMovie(state: state,height: height,width: width,);
                    } else {
                      return const LoadingData();
                    }
                  },
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: kSpacing),
                   child: Row(
                     children: [
                        SvgPicture.asset('assets/images/king.svg',height: 20),
                       SizedBox(width: kSpacing,),
                       Text('Những bộ phim được đánh giá cao',style: TextStyle(fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                BlocBuilder<TopRateMovieBloc, TopRateMovieState>(
                  builder: (context, state) {

                    // return CarouselSlider(items: items, options: CarouselOptions(height: height/3));
                    if (state is Loaded) {

                      return TopRateMovieUI(state: state,);
                    } else {
                      return const LoadingData();
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: kSpacing),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/popular.svg',height: 25,color: Colors.yellow,),
                      const SizedBox(width: kSpacing/2,),
                      const Text('Những bộ phim phổ biến',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                BlocBuilder<PopularBloc, PopularMovieState>(
                  builder: (context, state) {

                    // return CarouselSlider(items: items, options: CarouselOptions(height: height/3));
                    if (state is LoadedPopularMovie) {

                      return PopularMovieUI(state: state);
                    } else {
                      return const LoadingData();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

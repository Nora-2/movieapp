import 'package:flutter/material.dart';
import 'package:movies/Controller/cast.dart';
import 'package:movies/Model/cast.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/shimeee.dart';
import 'package:movies/presentation/cast/widgets/castcard.dart';
class CastingCards extends StatelessWidget {
  final String movieId;

  const CastingCards(this.movieId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Castcontroller movieProvider = Castcontroller();

    return FutureBuilder<List<Cast>>(
      future: movieProvider.getMovieCasting(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const shimmer();
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildEmptyWidget();
        }

        final List<Cast> casting = snapshot.data!;

        return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           
            children: [
            
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: casting.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final cast = casting[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                      child: Container(
                           decoration: BoxDecoration(     color: Appcolors.backcolor,borderRadius:const BorderRadius.all(Radius.circular(8),)),
                                       child: CastCard(cast)),
                    );
                  },
                ),
              ),
            ],
          
        );
      },
    );
  }



  Widget _buildEmptyWidget() {
    return Container(
      height: 260,
      alignment: Alignment.center,
      child: const Text('No cast available.'),
    );
  }
}

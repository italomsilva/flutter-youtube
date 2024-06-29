import 'package:flutter/material.dart';
import 'package:youtube/Model/VideoEntity.dart';
import 'package:youtube/Services/Api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<VideoEntity>> _listarVideos(){
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.pesquisar("");
    return FutureBuilder<List<VideoEntity>>(
        future: _listarVideos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData){

                var def = VideoEntity("", "", "", "", "");
                List<VideoEntity> videos = [def, def];
                videos = snapshot.data!;
                VideoEntity video;

                return ListView.separated(itemBuilder: (context, index){
                  video = videos[index];
                  return Column(
                    children: [
                      Text(video.titulo),
                      Image(image: NetworkImage(video.imagem))
                    ],
                  );
                },
                    separatorBuilder: (context, index)=>Divider(height: 10, color: Colors.transparent,),
                    itemCount: videos.length,
                );
              } else {
                return Center(child: Text("Data not found"),);
              }
          }
        }
    );
  }}

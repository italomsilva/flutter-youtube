class VideoEntity {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  VideoEntity(this.id, this.titulo, this.descricao, this.imagem, this.canal);

  factory VideoEntity.fromJson(Map<String, dynamic> video){
    return VideoEntity(
        video["id"]["videoId"],
        video["snippet"]["title"],
        video["snippet"]["description"],
        video["snippet"]["thumbnails"]["medium"]["url"],
        video["snippet"]["channelId"]
    );
  }
}

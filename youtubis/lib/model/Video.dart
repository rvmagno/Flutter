

class Video{

  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

/*

  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      canal: json["snippet"]["channelId"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"]
    );
  }
*/

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      canal: json["snippet"]["channelId"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"]
    );
  }

}
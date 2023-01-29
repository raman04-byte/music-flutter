import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });
  static List<Playlist> playlists = [
    Playlist(
      title: 'title',
      songs: Song.song,
      imageUrl:
          'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
    )
  ];
}

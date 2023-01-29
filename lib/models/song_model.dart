class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});
  List<Song> songs = [
    Song(
        title: 'As It Was',
        description: 'Harry Styles',
        url: 'assets/music/as_it_was.mp3',
        coverUrl: 'assets/images/as_it_was.jpeg')
  ];
}

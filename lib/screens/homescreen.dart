import 'package:flutter/material.dart';
import 'package:music/models/playlist_model.dart';

import '../models/song_model.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Song> song = Song.song;
  List<Playlist> playlists = Playlist.playlists;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepPurple.shade800.withOpacity(0.8),
          Colors.deepPurple.shade200.withOpacity(0.8),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            const _DiscoverMusic(),
            _TrendingMusic(song: song),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SectionHeader(title: 'Playlists'),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return PlayListCard(playlists: playlists[index]);
                    },
                  )
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: const _CustomNavigationBar(),
      ),
    );
  }
}



class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.song,
  });

  final List<Song> song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 20.0,
            ),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: song.length,
                itemBuilder: (context, index) {
                  return SongCard(songs: song[index]);
                }),
          ),
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Enjoy the music',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.black,
                hintText: 'Search',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none)),
          )
        ],
      ),
    );
  }
}

class _CustomNavigationBar extends StatelessWidget {
  const _CustomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Profile',
          ),
        ]);
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

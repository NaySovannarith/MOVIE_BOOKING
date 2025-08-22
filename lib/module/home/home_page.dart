import 'package:flutter/material.dart';
import 'package:movie_booking/data/movie_data.dart';
import 'package:movie_booking/data/view_model/movie_list_view_model.dart';
import 'package:movie_booking/module/components/tab_buttom.dart';
import 'package:movie_booking/module/home/widget/movie_card_v2.dart';
import 'package:movie_booking/module/home/widget/poster_slider.dart';
import 'package:movie_booking/module/home/widget/promote.dart';
import 'package:movie_booking/module/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNowShowing = true;
  final PageController _posterPageController = PageController();
  final MovieListViewModel _movieViewModel = MovieListViewModel();
  //final movies = isNowShowing ? _movieViewModel.getNowShowingMovies() : _movieViewModel.getComingSoonMovies();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupViewModel();
  }

  void _setupViewModel() {
    _movieViewModel.fetchMovies();
    handleMovieTabChange();
  }

  void handleMovieTabChange() {
    isNowShowing
        ? _movieViewModel.getNowShowingMovies()
        : _movieViewModel.getComingSoonMovies();
    print("Tab changed: ${_movieViewModel.movieList.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final movies = isNowShowing ? nowShowingMovies : comingSoonMovies;

    return Scaffold(
      //New Header
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Hey narith',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: CircleAvatar(
                radius: 20,
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const SizedBox(height: 20),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Movie",
                    hintStyle: TextStyle(color: Colors.grey),
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Posters Title
              const Text(
                "POSTERS",
                style: TextStyle(
                  color: Color.fromARGB(255, 141, 141, 141),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Horizontal Poster Carousel
              // Column(
              //   children: [
              //     SizedBox(
              //       height: 420,
              //       child: PageView.builder(
              //         controller: _posterPageController,
              //         itemCount: posterImages.length,
              //         itemBuilder: (context, index) {
              //           return PosterCard(img: posterImages[index]);
              //         },
              //       ),
              //     ),
              //     const SizedBox(height: 12),
              // PageIndicetor(
              //   posterPageController: _posterPageController,
              //   posterImages: posterImages,
              // ),
              //   ],
              // ),
              PosterSlider(),

              const SizedBox(height: 30),

              // Tabs (Now Showing / Coming Soon)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      isNowShowing = true;
                      handleMovieTabChange();
                    },
                    child: tabButton(
                      text: "Now showing",
                      isActive: isNowShowing,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      isNowShowing = false;
                      handleMovieTabChange();
                    },
                    child: tabButton(
                      text: "Coming Soon",
                      isActive: !isNowShowing,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Grid of Movies
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.55,
                ),
                itemCount: _movieViewModel.movieList.length,
                itemBuilder: (ctx, index) {
                  var movie = _movieViewModel.movieList[index];
                  return MovieCardV2(movie: movie);
                },
              ),
              // GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 2,
              //   crossAxisSpacing: 10,
              //   mainAxisSpacing: 10,
              //   physics: const NeverScrollableScrollPhysics(),
              //   childAspectRatio: 0.55,
              //   children:
              //       movies
              //           .map(
              //             (movie) => MovieCard(
              //               img: movie["img"]!,
              //               title: movie["title"]!,
              //               date: movie["date"]!,
              //               rating: movie["rating"]!,
              //             ),
              //           )
              //           .toList(),
              // ),
              const SizedBox(height: 10),

              // Promote section
              const Text(
                "Promotions",
                style: TextStyle(
                  color: Color.fromARGB(255, 141, 141, 141),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Promote(),
            ],
          ),
        ),
      ),
    );
  }
}

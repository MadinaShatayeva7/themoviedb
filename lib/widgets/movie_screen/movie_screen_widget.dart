import 'package:flutter/material.dart';

class Movie{
  final int id;
  final String movieName;
  final String dataName;
  final String descriptionName;

  Movie({
    required this.id,
    required this.movieName,
    required this.dataName,
    required this.descriptionName,
  });
}

class MovieScreen extends StatefulWidget {
  MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _movies = [
    Movie(
      id: 1,
      movieName: 'Золушка', 
      dataName: '10 октября 2022', 
      descriptionName: 'Спустя почти 5 000 лет после того, как он был наделен всемогущими силами египетских богов и так же быстро заключен в тюрьму.',),
    Movie(
      id: 2,
      movieName: 'Shrek', 
      dataName: '10 октября 2022', 
      descriptionName: 'Спустя почти 5 000 лет после того, как он был наделен всемогущими силами египетских богов и так же быстро заключен в тюрьму.',),
    Movie(
      id: 3,
      movieName: 'Холодное сердце', 
      dataName: '10 октября 2022', 
      descriptionName: 'Спустя почти 5 000 лет после того, как он был наделен всемогущими силами египетских богов и так же быстро заключен в тюрьму.',),
    Movie(
      id: 4,
      movieName: 'Золушка', 
      dataName: '10 октября 2022', 
      descriptionName: 'Спустя почти 5 000 лет после того, как он был наделен всемогущими силами египетских богов и так же быстро заключен в тюрьму.',),
    Movie(
      id: 5,
      movieName: 'Shrek', 
      dataName: '10 октября 2022', 
      descriptionName: 'Спустя почти 5 000 лет после того, как он был наделен всемогущими силами египетских богов и так же быстро заключен в тюрьму.',)
  ];

  var _filteredMovieList = <Movie>[];

  final _serachTextController = TextEditingController();

  void searchMovies(){
    final query = _serachTextController.text;
    if(query.isNotEmpty){
      _filteredMovieList = _movies.where((Movie movie) {
        return movie.movieName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovieList = _movies;
    }
    setState(() {
    });
  }

  @override 
  void initState() {
    super.initState();
    _filteredMovieList = _movies;
    _serachTextController.addListener(searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main_screen/movie_details',
    arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovieList.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index){
            final movie = _filteredMovieList[index];
            physics: BouncingScrollPhysics();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),          
              child: Stack(
                children: [Container(
                  decoration:            
                  BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    boxShadow: [(BoxShadow(color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0.0, 2.0)))]
                    ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(children: [
                    Image(image: AssetImage('assets/images/cinderella.jpg')),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text(movie.movieName, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 5),
                          Text(movie.dataName, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey),),
                          SizedBox(height: 10),
                          Text(movie.descriptionName, maxLines: 2, overflow: TextOverflow.ellipsis,),              
                      ],),
                    ),
                    SizedBox(width: 15,),
                  ],),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(                
                  borderRadius: BorderRadius.circular(10),
                    onTap: () => _onMovieTap(index),
                  ),
                ),            
              ]),
            );
          }
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _serachTextController,
                decoration: InputDecoration(border: OutlineInputBorder(), 
                filled: true, fillColor: Colors.white.withAlpha(220),
                labelText: 'Поиск'),
              ),
          ),
      ],
    );
      
  }
}
